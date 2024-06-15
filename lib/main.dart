import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile/screens/take_photo_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  // main 関数内で非同期処理を呼び出すための設定
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // デバイスで使用可能なカメラのリストを取得
  final cameras = await availableCameras();

  // 利用可能なカメラのリストから特定のカメラを取得
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Camera Example',
      theme: ThemeData(),
      home: TakePhotoScreen(camera: camera),
    );
  }
}