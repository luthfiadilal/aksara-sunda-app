import 'dart:async';
import 'dart:typed_data';
import 'dart:io'; // Pastikan untuk mengimpor dart:io
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:aksara_sunda/repository/drawing_repository.dart'; // Import repository
import 'package:aksara_sunda/models/drawing_model.dart'; // Import model

abstract class ImageEvent {}

class PickImageFromGallery extends ImageEvent {}

class PickImageFromCamera extends ImageEvent {}

class UploadImage extends ImageEvent {
  final String imagePath;
  final DrawingModel drawingModel; // Tambahkan drawingModel

  UploadImage(this.imagePath, this.drawingModel);
}

class ClearImage extends ImageEvent {} // Tambahkan event ClearImage

class ImageState {
  final DrawingModel? drawingModel; // Menggunakan DrawingModel
  final bool isUploading; // Menambahkan properti isUploading
  final String? prediction; // Menambahkan properti prediction

  ImageState({this.drawingModel, this.isUploading = false, this.prediction});
}

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagePicker _picker = ImagePicker();
  final DrawingRepository repository; // Tambahkan repository

  ImageBloc(this.repository) : super(ImageState()) {
    on<PickImageFromGallery>(_onPickImageFromGallery);
    on<PickImageFromCamera>(_onPickImageFromCamera);
    on<UploadImage>(_onUploadImage); // Tambahkan event upload
    on<ClearImage>(_onClearImage);
  }

  Future<void> _onPickImageFromGallery(
      PickImageFromGallery event, Emitter<ImageState> emit) async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(ImageState(
            drawingModel: DrawingModel(
                uri: pickedFile.path, prediction: ''))); // Set model
      } else {
        print("Tidak ada gambar yang dipilih dari galeri.");
      }
    } catch (e) {
      print("Error picking image from gallery: $e");
    }
  }

  Future<void> _onPickImageFromCamera(
      PickImageFromCamera event, Emitter<ImageState> emit) async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        emit(ImageState(
            drawingModel: DrawingModel(
                uri: pickedFile.path, prediction: ''))); // Set model
      } else {
        print("Tidak ada gambar yang diambil dari kamera.");
      }
    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }

  Future<void> _onUploadImage(
      UploadImage event, Emitter<ImageState> emit) async {
    emit(ImageState(
        drawingModel: event.drawingModel,
        isUploading: true)); // Set state to uploading
    try {
      // Convert image to Uint8List
      final Uint8List imageData = await _getImageData(event.imagePath);
      final prediction = await repository.uploadDrawing(imageData);

      // Emit state with prediction
      emit(ImageState(
          drawingModel:
              DrawingModel(uri: event.imagePath, prediction: prediction),
          isUploading: false,
          prediction: prediction)); // Set state after upload with prediction
    } catch (e) {
      print("Error uploading image: $e");
      emit(ImageState(
          drawingModel: event.drawingModel,
          isUploading: false)); // Reset uploading state
    }
  }

  Future<Uint8List> _getImageData(String imagePath) async {
    // Implementasi untuk mengkonversi imagePath ke Uint8List
    final file = File(imagePath);
    return await file.readAsBytes();
  }

  Future<void> _onClearImage(ClearImage event, Emitter<ImageState> emit) async {
    emit(ImageState()); // Reset state ke default
  }
}
