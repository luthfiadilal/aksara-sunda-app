import 'dart:io';

import 'package:aksara_sunda/bloc/image_bloc.dart';
import 'package:aksara_sunda/styles/container_image_process.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageProcessingPage extends StatefulWidget {
  const ImageProcessingPage({super.key});

  @override
  State<ImageProcessingPage> createState() => _ImageProcessingPageState();
}

class _ImageProcessingPageState extends State<ImageProcessingPage> {
  bool isProcessed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 197, 164, 124),
        foregroundColor: Colors.white,
        title: const Text("Image Processing"),
      ),
      body: BlocListener<ImageBloc, ImageState>(
        listener: (context, state) {
          if (state.prediction != null) {
            // Tampilkan SnackBar dengan hasil prediksi
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "Hasil Prediksi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: Text(
                    "Prediksi: ${state.prediction}",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text(
                        "Tutup",
                        style: TextStyle(
                          color: Color.fromARGB(255, 197, 164, 124),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Column(
          children: <Widget>[
            BlocBuilder<ImageBloc, ImageState>(
              builder: (context, state) {
                return Container(
                  width: MediaQuery.of(context).size.width.w,
                  height: 300.h,
                  color: Color.fromARGB(255, 197, 164, 124),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 260.w,
                            height: 260.h,
                            padding: EdgeInsets.all(20),
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Parent(
                                    style: containerImageProcess,
                                    child: Stack(
                                      children: <Widget>[
                                        if (state.drawingModel == null ||
                                            state
                                                .drawingModel!.uri.isEmpty) ...[
                                          Center(
                                            child: GestureDetector(
                                              onTap: () {
                                                BlocProvider.of<ImageBloc>(
                                                        context)
                                                    .add(
                                                        PickImageFromGallery());
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 20),
                                                width: 80.w,
                                                height: 80.h,
                                                child: SvgPicture.asset(
                                                  "images/plus.svg",
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 80),
                                              child: Text(
                                                "Pilih gambar",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17.sp),
                                              ),
                                            ),
                                          ),
                                        ] else ...[
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width
                                                .w,
                                            height: MediaQuery.of(context)
                                                .size
                                                .height
                                                .h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              image: DecorationImage(
                                                image: FileImage(
                                                  File(state.drawingModel!
                                                      .uri), // Menggunakan drawingModel
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // icon close
                          Positioned(
                            top: 10,
                            right: 10.w,
                            child: GestureDetector(
                              onTap: () {
                                BlocProvider.of<ImageBloc>(context)
                                    .add(ClearImage());
                              },
                              child: Container(
                                width: 28.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 59, 59, 59),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Icon(Icons.close, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                width: MediaQuery.of(context).size.width.w,
                color: Color.fromARGB(255, 197, 164, 124),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Pilih Gambar Yang Ingin Di Proses, atau ambil langsung foto dari kamera",
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<ImageBloc>(context)
                                  .add(PickImageFromGallery());
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    vertical: 14.0, horizontal: 10.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  width: 26.w,
                                  height: 26.h,
                                  "images/gallery.svg",
                                  color: Color.fromARGB(255, 197, 164, 124),
                                ),
                                SizedBox(width: 15.w),
                                Text(
                                  "Galeri",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color:
                                          Color.fromARGB(255, 197, 164, 124)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<ImageBloc>(context)
                                  .add(PickImageFromCamera());
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0.r),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    vertical: 14.0, horizontal: 10.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SvgPicture.asset(
                                  width: 26.w,
                                  height: 26.h,
                                  "images/camera.svg",
                                  color: Color.fromARGB(255, 197, 164, 124),
                                ),
                                SizedBox(width: 15.w),
                                Text(
                                  "Kamera",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color:
                                          Color.fromARGB(255, 197, 164, 124)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // BUTTON UNTUK PROSES IMAGE
                    BlocBuilder<ImageBloc, ImageState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (state.drawingModel != null &&
                                !state.isUploading) {
                              // Memanggil event UploadImage
                              BlocProvider.of<ImageBloc>(context).add(
                                UploadImage(state.drawingModel!.uri,
                                    state.drawingModel!),
                              );
                              isProcessed = true;
                            } else if (state.isUploading) {
                              // Tampilkan pesan jika sedang mengupload
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        "Sedang mengupload, silakan tunggu...")),
                              );
                            } else {
                              // Tampilkan pesan jika tidak ada gambar yang dipilih
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        "Silakan pilih gambar terlebih dahulu.")),
                              );
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0.r),
                              ),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 10.0),
                            ),
                          ),
                          child: state.isUploading
                              ? CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color.fromARGB(255, 197, 164, 124)),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SvgPicture.asset(
                                      width: 26.w,
                                      height: 26.h,
                                      "images/ai.svg",
                                      color: Color.fromARGB(255, 197, 164, 124),
                                    ),
                                    SizedBox(width: 15.w),
                                    Text(
                                      "Proses",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Color.fromARGB(
                                              255, 197, 164, 124)),
                                    ),
                                  ],
                                ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
