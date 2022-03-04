import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:camera/camera.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CameraController? controller;
  List? cameras = [];
  int? selectedCameraIdx;
  String? imagePath;

  @override
  void initState() {
    super.initState();

    availableCameras()
        .then((availableCameras) => () {
              cameras = availableCameras;
              if (cameras!.isNotEmpty) {
                setState(() {
                  selectedCameraIdx = 0;
                });
                _initCameraController(cameras![selectedCameraIdx!])
                    .then((void v) {});
              } else {
                print('No camera');
              }
              print('this are the cameras number $cameras');
            })
        .catchError((err) {
      print(' $err THIS ERROR');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);
    // the controller is updated then update the ui

    controller!.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (controller!.value.hasError) {
        print('camera error ${controller!.value.errorDescription}');
      }
    });
    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  // String imageUrl =
  //     'https://media.istockphoto.com/photos/happy-adult-man-walking-sunny-city-street-sidewalk-picture-id1310533208';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage('assets/image-1.jpeg'), fit: BoxFit.fill),
          // ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(child: _cameraPreviewWidget()),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _camaraToggleRowWidget(),
                    _captureControlRowWidget(context),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  void _onCapturedPressed(context) async {
    print('snap');
  }

  Widget _cameraPreviewWidget() {
    return Container();
  }

  Widget _camaraToggleRowWidget() {
    return Spacer();
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError message: ${e.description}';
    print(errorText);
    print('Error: ${e.code}\n ${e.description}');
  }

  Widget _captureControlRowWidget(BuildContext context) {
    return Expanded(
        child: Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
              child: GestureDetector(
                onLongPress: () {
                  print('long press');
                },
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                      color: mainThemeColor.withOpacity(0.5),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3)),
                ),
              ),
              onPressed: () {
                _onCapturedPressed(context);
              })
        ],
      ),
    ));
  }
}
