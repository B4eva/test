import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl =
      'https://media.istockphoto.com/photos/happy-adult-man-walking-sunny-city-street-sidewalk-picture-id1310533208';

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
