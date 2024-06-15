import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mobile/screens/display_photo_screen.dart';

class TakePhotoScreen extends StatefulWidget {
  const TakePhotoScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePhotoScreenState createState() => TakePhotoScreenState();
}

class TakePhotoScreenState extends State<TakePhotoScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      // カメラを指定
      widget.camera,
      // 解像度を定義
      ResolutionPreset.medium,
    );

    // コントローラーを初期化
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ウィジェットが破棄されたら、コントローラーを破棄
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 写真を撮る
          final image = await _controller.takePicture();
          // 表示用の画面に遷移
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DisplayPhotoScreen(imagePath: image.path),
              fullscreenDialog: true,
            ),
          );
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
