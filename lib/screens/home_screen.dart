import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/main.dart';
import 'package:mobile/provider/camera_provider.dart';
import 'package:mobile/widget/CameraPreviewWidget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CameraDescription? camera = ref.watch(cameraProvider);

    if (camera == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("No Camera")),
        body: const Center(child: Text("No camera available on this device")),
      );
    }
    // カメラが利用可能な場合の UI
    return Scaffold(
      appBar: AppBar(title: const Text("Camera")),
      body: CameraPreviewWidget(camera: camera), // この部分はカメラプレビューウィジェットを指す
    );
  }
}
