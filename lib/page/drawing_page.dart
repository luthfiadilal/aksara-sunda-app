import 'dart:convert';
import 'dart:typed_data';

import 'package:aksara_sunda/bloc/drawing_bloc.dart';
import 'package:aksara_sunda/bloc/drawing_event.dart';
import 'package:aksara_sunda/bloc/drawing_state.dart';
import 'package:aksara_sunda/repository/drawing_repository.dart';
import 'package:aksara_sunda/services/drawing_service.dart';
import 'package:aksara_sunda/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signature/signature.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawingPage extends StatefulWidget {
  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPage> {
  late SignatureController _controller;
  bool _isLoading = false;

  final List<String> _textOptions = [
    "a",
    "e",
    "é",
    "eu",
    "i",
    "u",
    "o",
    "ba",
    "ca",
    "da",
    "fa",
    "ga",
    "ha",
    "ja",
    "ka",
    "la",
    "ma",
    "na",
    "nga",
    "nya",
    "pa",
    "qa",
    "ra",
    "sa",
    "ta",
    "va",
    "wa",
    "xa",
    "ya",
    "za",
  ];
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = SignatureController(
      penStrokeWidth: 3,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextText() {
    setState(() {
      _selectedIndex = (_selectedIndex + 1) % _textOptions.length;
    });
  }

  void _previousText() {
    setState(() {
      _selectedIndex =
          (_selectedIndex - 1 + _textOptions.length) % _textOptions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DrawingRepository drawingRepository = DrawingRepository();

    return BlocProvider(
      create: (context) => DrawingBloc(_controller, drawingRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Belajar Tulis'),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          "Pilih Akasara yang ingin kamu tulis",
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_left,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                onPressed: _previousText,
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              _textOptions[_selectedIndex],
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor),
                            ),
                            SizedBox(width: 20),
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primaryColor,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.arrow_right,
                                    size: 30, color: Colors.white),
                                onPressed: _nextText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Signature(
                    controller: _controller,
                    width: double.infinity,
                    height: double.infinity,
                    backgroundColor: Colors.white,
                  ),
                ),
                Builder(
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.only(
                          bottom: 30, right: 20, left: 20, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<DrawingBloc>(context)
                                    .add(ClearDrawingEvent());
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                    side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 197, 164, 124)),
                                  ),
                                ),
                              ),
                              child: Text('Hapus',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 197, 164, 124))),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isLoading = true;
                                });
                                BlocProvider.of<DrawingBloc>(context)
                                    .add(CaptureDrawingEvent());
                              },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 197, 164, 124)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0.r)),
                                ),
                              ),
                              child: Text('Cek',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                BlocConsumer<DrawingBloc, DrawingState>(
                  listener: (context, state) {
                    if (state is DrawingLoading) {
                      setState(() {
                        _isLoading = true;
                      });
                    } else {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                    if (state is DrawingCaptured) {
                      final selectedText = _textOptions[_selectedIndex];
                      final prediction = state.drawing.prediction;

                      if (prediction == selectedText) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Selamat!"),
                              content: Text(
                                  "Kamu sudah bisa menulis aksara sunda ($selectedText)"),
                              actions: [
                                TextButton(
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 197, 164, 124)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Coba Lagi"),
                              content: Text("Coba lagi dan terus belajar"),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    } else if (state is DrawingEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Kamu belum menulis',
                              style: TextStyle(fontSize: 16)),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
            if (_isLoading)
              Container(
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 197, 164, 124),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
