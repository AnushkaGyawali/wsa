import 'package:camera/camera.dart';

class CameraService {
  late CameraController _controller;

  Future<void> initialize() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras.first, ResolutionPreset.high);
    await _controller.initialize();
  }

  Future<void> startVideoRecording() async {
    if (_controller.value.isInitialized) {
      await _controller.startVideoRecording();
    }
  }

  void dispose() {
    _controller.dispose();
  }
}
