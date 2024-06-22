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
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

    // Automatically close the dialog after 5 seconds
    // Timer(Duration(seconds: 5), () {
    //   Navigator.of(context, rootNavigator: true).pop();
    // });
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
                      child: Image.asset(
                        'assets/images/${widget.filter}.png',
                        fit: BoxFit.cover,
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
            onPressed: () async {
              try {
                await _initializeControllerFuture;
                final image = await _controller.takePicture();
                await widget.upload(image.path);
                await _controller.dispose(); // カメラを解放
                if (widget.questionCount == 4) {
                  GoRouter.of(context).go('/home/result'); // 画面遷移
                  return;
                }
                GoRouter.of(context)
                    .go('/home/question${widget.questionCount + 1}'); // 画面遷移
              } catch (e) {
                print(e);
              }
            },
            child: const Icon(Icons.camera_alt),
          ),
        ),
      ),
    );
  }
}
