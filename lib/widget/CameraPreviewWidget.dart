import 'dart:async';
import 'dart:ffi';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/widget/LoadingTextModal.dart';
import 'package:mobile/widget/TextModal.dart';

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
    var dialogContext;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        dialogContext = context;
        return TextCustomModal(message: widget.theme);
      },
    );

    // Close the dialog after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(dialogContext)
          .pop(); // This will close the modal after 5 seconds
    });
  }

  void _showUploadingModal() {
    showDialog(
      context: context,
      barrierDismissible:
          false, // User cannot dismiss the dialog by tapping outside of it
      builder: (BuildContext context) {
        return TextCustomModal(message: "Uploading...");
      },
    );
  }

  Future<void> _capturePicture() async {
    if (_isButtonDisabled) return; // Check if the button is disabled
    _isButtonDisabled = true; // Disable the button
    var uploadingDialogContext; // To hold the context of the uploading dialog

    try {
      await _initializeControllerFuture;

      // Show uploading modal before the upload begins
      showDialog(
        context: context,
        barrierDismissible:
            false, // User cannot dismiss the dialog by tapping outside of it
        builder: (BuildContext context) {
          uploadingDialogContext = context; // Store the context of the dialog
          return LoadingTextCustomModal(message: "採点しています...");
        },
      );

      final image = await _controller.takePicture();
      await widget.upload(image.path); // Upload the image

      // Use the stored dialog context to dismiss the uploading modal
      Navigator.of(uploadingDialogContext).pop();
    } catch (e) {
      print(e);
      // If an error occurs, ensure we also dismiss the modal
      if (uploadingDialogContext != null) {
        Navigator.of(uploadingDialogContext).maybePop();
      }
    } finally {
      _isButtonDisabled = false; // Re-enable the button after processing

      // Ensure the modal is closed in case of an error
      if (uploadingDialogContext != null) {
        Navigator.of(uploadingDialogContext).maybePop();
      }

      await _controller.dispose();
      _timer.cancel();

      // Navigate based on the question count
      if (widget.questionCount == 4) {
        GoRouter.of(context).go('/home/result');
      } else {
        GoRouter.of(context).go('/home/question${widget.questionCount + 1}');
      }
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
