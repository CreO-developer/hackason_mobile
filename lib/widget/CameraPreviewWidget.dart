import 'dart:async';
import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CameraPreviewWidget extends StatefulWidget {
  final CameraDescription camera;
  final String filter;
  final String theme;
  final int questionCount;
  final Function(String) upload;

  const CameraPreviewWidget(
      {Key? key,
      required this.camera,
      required this.filter,
      required this.theme,
      required this.upload,
      required this.questionCount})
      : super(key: key);

  @override
  _CameraPreviewWidgetState createState() => _CameraPreviewWidgetState();
}

class _CameraPreviewWidgetState extends State<CameraPreviewWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late Timer _timer;
  int _remainingTime = 30;
  bool _isButtonDisabled = false; // Add a flag to track button state

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize().then((_) {
      // After the camera is initialized, show the theme modal
      _showThemeModal();
      _startTimer();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          _capturePicture();
        }
      });
    });
  }

  void _showThemeModal() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              widget.theme,
              style: TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    );
  }

  Future<void> _capturePicture() async {
    if (_isButtonDisabled) return; // Check if the button is disabled
    _isButtonDisabled = true; // Disable the button
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      await widget.upload(image.path);
      await _controller.dispose();
      await _controller.dispose();
      await _controller.dispose();
      _timer.cancel();

      if (widget.questionCount == 4) {
        print('Go to result');
        GoRouter.of(context).go('/home/result');
        return;
      } else {
        GoRouter.of(context).go('/home/question${widget.questionCount + 1}');
        return;
      }
    } catch (e) {
      print(e);
    } finally {
      _isButtonDisabled = false; // Re-enable the button after processing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  CameraPreview(_controller),
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.5,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          _remainingTime <= 5
                              ? Colors.red.withOpacity(0.5)
                              : Colors.transparent,
                          BlendMode.srcATop,
                        ),
                        child: Image.asset(
                          'assets/images/${widget.filter}.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5), //
                      decoration: BoxDecoration(
                        color: _remainingTime <= 5
                            ? Color(0xFFC9342A)
                            : Color(0xFF54BD6B),
                        borderRadius:
                            BorderRadius.circular(20), // More rounded corners
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${_remainingTime}s',
                            style: TextStyle(
                              color: _remainingTime <= 5
                                  ? Colors.red
                                  : Colors
                                      .white, // Red color if time is 5 or less
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16.0),
          child: FloatingActionButton(
            onPressed: _capturePicture,
            backgroundColor: Colors.transparent,
            foregroundColor: Color(0xFF373A4D),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)), // 角を丸くする
              side: BorderSide(color: Color(0xFF373A4D), width: 5), // 白い線で枠を作成
            ),
            child: const Icon(Icons.camera_alt),
          ),
        ),
      ),
    );
  }
}
