import 'package:counting_app/icons.dart';
import 'package:counting_app/result.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';

import 'image.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  /// Variables
  File? image;
  late File imageFile;
  @override
  void initState() {
    initializeCamera(selectedCamera); //Initially selectedCamera = 0
    super.initState();
  }

  late CameraController _controller; //To control the camera
  late Future<void>
  _initializeControllerFuture; //Future to wait until camera initializes
  int selectedCamera = 0;
  List<File> capturedImages = [];

  initializeCamera(int cameraIndex) async {
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.cameras[cameraIndex],
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  Future pickImage(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImagePage(image: this.image, cameras: widget.cameras)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,   // delete debug
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(228, 220, 207, 0.8)),
      title: 'Counting App',
      home: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: (MediaQuery
              .of(context)
              .size
              .height / 1334) * 261,
          // helps get height from device
          backgroundColor: const Color.fromRGBO(87, 111, 114, 1),
          // change appbar color
          flexibleSpace: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max, //min
              children: <Widget>[
                SizedBox( // empty space
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 53,
                ),
                SizedBox(
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 101,
                  width: (MediaQuery
                      .of(context)
                      .size
                      .width / 750) * 498,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Counting App',
                      textAlign: TextAlign.center,
                      // make center y axis
                      //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
                      style: TextStyle(
                          color: const Color.fromRGBO(228, 220, 207, 0.8),
                          fontSize: 72 * MediaQuery
                              .of(context)
                              .textScaleFactor,
                          fontFamily: 'PoppinsRegular'),
                    ),
                  ),
                ),
                SizedBox( // empty space
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 26,
                ),
                SizedBox(
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 51,
                  width: (MediaQuery
                      .of(context)
                      .size
                      .width / 750) * 392,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child:RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Count the ", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsRegular')),
                          TextSpan(text: "paperclips", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsSemibold')),
                          TextSpan(text: ":", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsRegular')),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          shape: const RoundedRectangleBorder( // round appBar
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        // rounded navigation bar
        //**
        body:Center(
          child:FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return CameraPreview(_controller);
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),


        bottomNavigationBar: Container(
          height: (MediaQuery
              .of(context)
              .size
              .height / 1334) * 248,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), // adjust to your liking
              topRight: Radius.circular(30.0), // adjust to your liking
            ),
            color: Color.fromRGBO(87, 111, 114, 1), // put the color here
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              SizedBox( // empty space
                width: (MediaQuery
                    .of(context)
                    .size
                    .width / 750) * 58.32,
              ),
              GestureDetector(
                onTap: () {
                  pickImage(context);
                },
                child:SizedBox( // empty space
                  width: (MediaQuery
                      .of(context)
                      .size
                      .width / 750) * 117.36,
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 102.87,
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Icon( MyFlutterApp.image_solid, color: Color.fromRGBO(240, 235, 227, 1)),
                  ),
                ),
              ),
              SizedBox( // empty space
                width: (MediaQuery
                    .of(context)
                    .size
                    .width / 750) * 120.32,
                height:(MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 157 ,
              ),
              GestureDetector(
                onTap: () async {
                  await _initializeControllerFuture;
                  var xFile = await _controller.takePicture();
                  setState(() {
                    capturedImages.add(File(xFile.path));
                  });
                  if (capturedImages.isEmpty) return;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              image: capturedImages.last, cameras: widget.cameras)));
                  //Navigator.of(context).pop();
                },
                child: Container(
                  width: (MediaQuery
                      .of(context)
                      .size
                      .width / 750) * 157,
                  height:(MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 157 ,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 5, color: const Color.fromRGBO(125, 157, 156, 1)),
                    //color: const Color.fromRGBO(240, 235, 227, 1),
                  ),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Stack(
                      alignment: Alignment.center,
                      children: const <Widget>[
                        Icon(
                          MyFlutterApp.circle_solid,
                          size: 200,
                          color: Color.fromRGBO(228, 220, 207, 1),
                        ),
                        Text(
                          "count",
                          style: TextStyle(fontSize: 36,color: Color.fromRGBO(87, 111, 114, 1),fontFamily: 'PoppinsRegular'), //size:55
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox( // count icon first version
              //  width: (MediaQuery
              //      .of(context)
              //      .size
              //      .width / 1334) * 157,
              //  height:(MediaQuery
              //      .of(context)
              //      .size
              //      .height / 1334) * 157 ,
              //  child: const FittedBox(
              //    fit: BoxFit.contain,
              //    //child: ElevatedButton.icon(
              //    //  onPressed: () {},
              //    //  icon: const Icon( MyFlutterApp.circle_solid, color: Color.fromRGBO(240, 235, 227, 1)),
              //    //  label: const Text( 'Count', style: TextStyle(fontFamily: 'Poppins', fontSize: 36,color: Color.fromRGBO(87, 111, 114, 1))),
              //    //  style: ElevatedButton.styleFrom(
              //    //    shadowColor: const Color.fromRGBO(87, 111, 114, 1),
              //    //    textStyle: const TextStyle(fontSize: 36),
              //    //  ),
              //    //),
              //    child: Icon( MyFlutterApp.circle_solid, color: Color.fromRGBO(240, 235, 227, 1)),
              //  ),
              //),
              SizedBox( // empty space
                width: (MediaQuery
                    .of(context)
                    .size
                    .width / 750) * 105.32,
                height:(MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 157 ,
              ),
              GestureDetector( // empty space
                onTap: () {
                  if (widget.cameras.length > 1) {
                    setState(() {
                      selectedCamera = selectedCamera == 0 ? 1 : 0;
                      initializeCamera(selectedCamera);
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('No secondary camera found'),
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                child:Container(
                  margin: const EdgeInsets.only(left: 0,bottom: 0,right: 0,top: 0),
                  width: (MediaQuery
                      .of(context)
                      .size
                      .width / 750) * 122.18,
                  height:(MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 107 ,
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Icon( MyFlutterApp.camera_rotate_solid, color: Color.fromRGBO(240, 235, 227, 1)),
                  ),
                ),
              ),
              SizedBox( // empty space
                width: (MediaQuery
                    .of(context)
                    .size
                    .width / 750) * 54.5,
              ),
            ],
          ),
          //child: BottomNavigationBar(backgroundColor: Colors.transparent), // don't forget to put it
        ),
        //**
        // empty bottom bar
        //bottomNavigationBar: Container(
        //  height: (MediaQuery.of(context).size.height/1334)*78,
        //  color: appBar,
        //
        //),
      ),
    );
  }
}

