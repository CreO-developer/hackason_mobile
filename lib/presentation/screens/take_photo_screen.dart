import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mobile/presentation/screens/display_photo_screen.dart';

const PHOTO_NUM = 3;
const DELAY_TIME = 5;

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
  List<String> _imagePaths = [];
  int _photoCount = 0;
  Timer? _timer;
  bool _isTakingPhoto = false;

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
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    try {
      setState(() {
        _isTakingPhoto = true;
      });

      final image = await _controller.takePicture();

      setState(() {
        _imagePaths.add(image.path); // 撮影した画像のパスをリストに追加
      });

      setState(() {
        _photoCount++;
      });

      if (_photoCount < PHOTO_NUM) {
        // 次のDELAY_TIME秒後に再度撮影を開始する
        _timer = Timer(Duration(seconds: DELAY_TIME), () {
          _takePicture();
        });
      } else {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DisplayPhotoScreen(imagePath: _imagePaths),
            fullscreenDialog: true,
          ),
        );
      }
    } catch (e) {
      print('Error taking picture: $e');
    } finally {
      setState(() {
        _isTakingPhoto = false;
      });
    }
  }

  Future<void> _startTakingPhotos() async {
    setState(() {
      _isTakingPhoto = true;
    });

    await Future.delayed(Duration(seconds: DELAY_TIME));

    _takePicture();
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
        onPressed: _isTakingPhoto || _photoCount >= PHOTO_NUM
            ? null
            : _startTakingPhotos,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
