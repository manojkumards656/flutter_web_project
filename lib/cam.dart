import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraScreen extends StatefulWidget {
  final CameraController? cameraController;

  CameraScreen({this.cameraController});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    if (widget.cameraController != null) {
      _cameraController = widget.cameraController!;
      _initializeControllerFuture = _cameraController.initialize();
      _initializeControllerFuture.then((_) {
        setState(() {
          isCameraInitialized = true;
        });
      });
    } else {
      _initializeCamera();
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _cameraController.initialize();
    await _initializeControllerFuture;
    setState(() {
      isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Capture')),
      body: isCameraInitialized
          ? CameraPreview(_cameraController)
          : Center(child: CircularProgressIndicator()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _cameraController.takePicture();
            print('Image captured at path ${image.path}');
          } catch (e) {
            print("Error capturing image: $e");
          }
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
