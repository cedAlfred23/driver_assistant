import 'package:driver_assistant/screens/dashboard/landing.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter/tflite_flutter_platform_interface.dart';
import 'dart:math' as math;
import './boundary_box.dart';

class FaceDetectionFromLiveCamera extends StatefulWidget {
  @override
  _FaceDetectionFromLiveCameraState createState() =>
      _FaceDetectionFromLiveCameraState();
}

class _FaceDetectionFromLiveCameraState
    extends State<FaceDetectionFromLiveCamera> {
  late List<CameraDescription> _availableCameras;
  late CameraController cameraController;
  bool isDetecting = false;
  late List<dynamic> _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  bool front = true;
  late Interpreter _interpreter;
  @override
  void initState() {
    super.initState();
    loadModel();
    _getAvailableCameras();
  }

  @override
  void dispose() {
    cameraController.dispose();
    _interpreter.close();
    super.dispose();
  }

  Future<void> _getAvailableCameras() async {
    WidgetsFlutterBinding.ensureInitialized();
    _availableCameras = await availableCameras();
    _initializeCamera(_availableCameras[1]);
  }

  void loadModel() async {
    //  await Interpreter.fromAsset('assets/model_unquant_drow.tflite');
      // await Tflite.loadModel(
      //   model: "assets/model_unquant_drow.tflite",
      //   labels: "assets/label.txt",
      // );
    try {
      _interpreter =
          await Interpreter.fromAsset('assets/model_unquant_drow.tflite');
      print('Model loaded successfully');
    } catch (e) {
      print('Failed to load model: $e');
    }
  }

  Future<void> _initializeCamera(CameraDescription description) async {
    cameraController = CameraController(description, ResolutionPreset.high);
    try {
      await cameraController.initialize().then(
        (_) {
          if (!mounted) {
            return;
          }
          cameraController.startImageStream(
            (CameraImage img) {
              if (!isDetecting) {
                isDetecting = true;
                // Tflite.runModelOnFrame(
                //   bytesList: img.planes.map(
                //     (plane) {
                //       return plane.bytes;
                //     },
                //   ).toList(),
                //   threshold: 0.5,
                //   rotation: 0,
                //   imageHeight: img.height,
                //   imageWidth: img.width,
                //   numResults: 1,
                // ).then(
                //   (recognitions) {
                //     setRecognitions(recognitions, img.height, img.width);
                //     isDetecting = false;
                //   },
                // );
              }
            },
          );
        },
      );
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void _toggleCameraLens() {
    // get current lens direction (front / rear)
    final lensDirection = cameraController.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = _availableCameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    } else {
      newDescription = _availableCameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    }

    if (newDescription != null) {
      _initializeCamera(newDescription);
    } else {
      print('Asked camera not available');
    }
  }

  void setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    if (!cameraController.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Container(
      constraints: const BoxConstraints.expand(),
      child: cameraController == null
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  front == true ? front = false : front = true;
                  _toggleCameraLens();
                },
                child: Icon(
                    front == true ? Icons.camera_rear : Icons.camera_front),
              ),
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: Text("Driver Assistant"),
                centerTitle: true,
                backgroundColor: Color(0xFF21BFBD),
                leading: InkWell(
                  child: Icon(Icons.cancel),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
              ),
              body: Stack(
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: 1 / cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController),
                    ),
                  ),
                  // BoundaryBox(
                  //     _recognitions == null ? [] : _recognitions,
                  //     math.max(_imageHeight, _imageWidth),
                  //     math.min(_imageHeight, _imageWidth),
                  //     screen.height,
                  //     screen.width),
                ],
              ),
            ),
    );
  }
}
