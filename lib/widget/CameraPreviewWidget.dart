import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewWidget extends StatefulWidget {
  final CameraDescription camera;

  const CameraPreviewWidget({Key? key, required this.camera}) : super(key: key);

  @override
  _CameraPreviewWidgetState createState() => _CameraPreviewWidgetState();
}

class _CameraPreviewWidgetState extends State<CameraPreviewWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // カメラコントローラを作成
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    // コントローラを初期化し、カメラのプレビューを準備
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ウィジェットが破棄される時にコントローラを破棄
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // カメラの初期化が完了したら、プレビューを表示
          return CameraPreview(_controller);
        } else {
          // 初期化中はローディングインジケータを表示
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
