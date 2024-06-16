import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraControllerNotifier extends StateNotifier<CameraController?> {
  CameraControllerNotifier() : super(null);

  Future<void> initializeCamera(CameraDescription camera) async {
    final cameraController = CameraController(
      camera,
      ResolutionPreset.medium,
    );
    await cameraController.initialize();
    state = cameraController;
  }

  @override
  void dispose() {
    state?.dispose();
    super.dispose();
  }
}

final cameraControllerProvider =
    StateNotifierProvider<CameraControllerNotifier, CameraController?>(
  (ref) => CameraControllerNotifier(),
);
