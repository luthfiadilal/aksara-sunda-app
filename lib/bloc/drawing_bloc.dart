import 'dart:typed_data';

import 'package:aksara_sunda/bloc/drawing_event.dart';
import 'package:aksara_sunda/bloc/drawing_state.dart';
import 'package:aksara_sunda/models/drawing_model.dart';
import 'package:aksara_sunda/repository/drawing_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:signature/signature.dart';

class DrawingBloc extends Bloc<DrawingEvent, DrawingState> {
  final SignatureController signatureController;
  final DrawingRepository repository;
  bool _isCapturing = false;

  DrawingBloc(this.signatureController, this.repository)
      : super(DrawingEmpty()) {
    on<CaptureDrawingEvent>(_onCaptureDrawing);
    on<ClearDrawingEvent>(_onClearDrawing);
  }

  Future<void> _onCaptureDrawing(
      CaptureDrawingEvent event, Emitter<DrawingState> emit) async {
    if (_isCapturing) return;
    _isCapturing = true;

    try {
      // Emit loading state
      emit(DrawingLoading());

      if (signatureController.isNotEmpty) {
        final Uint8List? pngData =
            await signatureController.toPngBytes(width: 600, height: 600);

        if (pngData != null) {
          // Convert PNG to JPEG and send to repository for upload
          final prediction = await repository.uploadDrawing(pngData);
          emit(DrawingCaptured(
              DrawingModel(uri: pngData.toString(), prediction: prediction)));
        } else {
          emit(DrawingEmpty());
        }
      } else {
        emit(DrawingEmpty());
      }
    } catch (e) {
      print("Error during capture: $e");
      emit(DrawingEmpty());
    } finally {
      _isCapturing = false;
    }
  }

  void _onClearDrawing(ClearDrawingEvent event, Emitter<DrawingState> emit) {
    signatureController.clear();
    emit(DrawingEmpty());
  }
}
