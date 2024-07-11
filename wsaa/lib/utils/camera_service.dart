import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class CameraService {
  late CameraController _controller;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras.first, ResolutionPreset.high);
    await _controller.initialize();
  }

  Future<void> startVideoRecording() async {
    if (!_controller.value.isRecordingVideo) {
      await _controller.startVideoRecording();
    }
  }

  Future<void> stopVideoRecording() async {
    if (_controller.value.isRecordingVideo) {
      final videoFile = await _controller.stopVideoRecording();
      await _uploadFile(videoFile.path, 'videos/${DateTime.now().millisecondsSinceEpoch}.mp4');
    }
  }

  Future<void> _uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await _storage.ref(fileName).putFile(file);
    } on FirebaseException catch (e) {
      print('Error uploading file: $e');
    }
  }

  void dispose() {
    _controller.dispose();
  }
}
