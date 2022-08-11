import 'dart:io';
import 'package:camera/camera.dart';
import 'package:counting_app/icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

import 'camera.dart';
import 'home.dart';
import 'image.dart';


class Object1 {
  // Use DetectionMode.stream when processing camera feed.
  // Use DetectionMode.single when processing a single image.
  // Options to configure the detector while using with base model.
  final objectDetector =  ObjectDetector(options: ObjectDetectorOptions(mode: DetectionMode.single,classifyObjects: true,multipleObjects: true));
  Object1 ();
}


class ResultPage extends StatefulWidget {
  File? image;
  final String? item;
  final List<CameraDescription> cameras;
  ResultPage({Key? key, required this.image, required this.cameras,required this.item}) : super(key: key);

  @override
  ResultPageState createState() => ResultPageState();
}

class ResultPageState extends State<ResultPage> {
  late Future count;
  late final List<DetectedObject> objects;
  late final inputImage ;



  Future pickImage(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image == null) return;
    final imageTemp = File(image.path);
    setState(() => widget.image = imageTemp);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ImagePage(image: widget.image, cameras: widget.cameras,item: widget.item,)));
  }

  Future countImage() async {
    // ml_kit_objectDetection
    inputImage = InputImage.fromFile(File(widget.image!.path));
    Object1 on1 = Object1();
    objects = await on1.objectDetector.processImage(inputImage);
    on1.objectDetector.close();
  }

  @override
  void initState() {
    super.initState();
    count = countImage();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,   // delete debug
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(228, 220, 207, 1)),
      title: 'Counting App',
      home: Scaffold(
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(cameras: widget.cameras)));
                  },
                  child:SizedBox(
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
                        style: TextStyle(
                            color: const Color.fromRGBO(240, 235, 227, 1),
                            fontSize: 72 * MediaQuery
                                .of(context)
                                .textScaleFactor,
                            fontFamily: 'PoppinsRegular'),
                      ),
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
                          TextSpan(text: "Count the ", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsRegular')),
                          //TextSpan(text: "paperclips", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsSemibold')),
                          TextSpan(text: widget.item, style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsSemibold')),
                          TextSpan(text: ":", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsRegular')),
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
        bottomNavigationBar: Container(
          height: (MediaQuery
              .of(context)
              .size
              .height / 1334) * 999,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), // adjust to your liking
              topRight: Radius.circular(30.0), // adjust to your liking
            ),
            color: Color.fromRGBO(87, 111, 114, 1), // put the color here
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SizedBox( // empty space
                height: (MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 78,
              ),
              Container( // empty space
                width: (MediaQuery
                    .of(context)
                    .size
                    .width / 750) * 353,
                height: (MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 353,
                decoration: const BoxDecoration(
                  //shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromRGBO(87, 111, 114, 1),
                ),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child:widget.image != null ? Image.file(widget.image!,fit: BoxFit.fill,): const Text("No image selected"),
                ),
              ),
              SizedBox( // empty space
                height:(MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 78 ,
              ),
              Container(
                width: (MediaQuery
                    .of(context)
                    .size
                    .width / 750) * 592,
                height:(MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 197 ,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromRGBO(125, 157, 156, 1),
                ),
                child: Center(
                  child:Container(
                    width: (MediaQuery
                        .of(context)
                        .size
                        .width / 750) * 517,
                    height:(MediaQuery
                        .of(context)
                        .size
                        .height / 1334) * 150 ,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom:(MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 24.5,left: ( MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 22.5, right: ( MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 357.5),
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 137,
                          height:(MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 58,
                          child:FittedBox(
                            alignment: Alignment.topLeft,
                            fit: BoxFit.contain,
                            child:Text("Result",style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 48 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoBold')),
                          ),
                        ),
                        Container(
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 517,
                          height:(MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 0 ,
                          decoration: BoxDecoration(
                            border: Border.all(width: (MediaQuery.of(context).size.width / 750) * 2.5 ,style: BorderStyle.solid,color: const Color.fromRGBO(240, 235, 227, 1),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only( top: ( MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 24.5, left: ( MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 22.5, right: ( MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 35.5 ),
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 459,
                          height:(MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 43,
                          child:FittedBox(
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.contain,
                            child:FutureBuilder (
                              future: count,
                              builder: (context, snapshot){
                                return RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: "There are ", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoRegular')),
                                      //TextSpan(text: "9 paperclips.", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoBold')),
                                      TextSpan(text: objects.length.toString(), style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoBold')),
                                      TextSpan(text: " ", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoBold')),
                                      TextSpan(text: widget.item, style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoBold')),
                                      TextSpan(text: ".", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoBold')),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox( // empty space
                height:(MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 70 ,
              ),
              Container( // empty space
                width: (MediaQuery
                    .of(context)
                    .size
                    .width / 750) * 486,
                height:(MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 175 ,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color.fromRGBO(125, 157, 156, 1)
                ),
                child: Center(
                  child:Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height:(MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 20,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom:(MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 14.42,left: ( MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 40, right: ( MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 40),
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 406,
                          height:(MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 43,
                          child:FittedBox(
                            alignment: Alignment.topLeft,
                            fit: BoxFit.contain,
                            child:RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: "new count for ", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoRegular')),
                                  //TextSpan(text: "paperclips", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoBold')),
                                  TextSpan(text: widget.item, style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoBold')),
                                  TextSpan(text: ":", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoRegular')),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                pickImage(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only( left: ( MediaQuery
                                    .of(context)
                                    .size
                                    .width / 750) * 90,),
                                width: (MediaQuery
                                    .of(context)
                                    .size
                                    .width / 750) * 88.47,
                                height:(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 1334) * 77.55,
                                child:const FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.contain,
                                  child:Icon(MyFlutterApp.image_solid,color: Color.fromRGBO(240, 235, 227, 1)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (MediaQuery
                                  .of(context)
                                  .size
                                  .width / 750) * 126.9,
                              height:(MediaQuery
                                  .of(context)
                                  .size
                                  .height / 1334) * 77.55,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => CameraPage(cameras: widget.cameras,item: widget.item,)));
                              },
                              child: Container(
                                margin: EdgeInsets.only( right: ( MediaQuery
                                    .of(context)
                                    .size
                                    .width / 750) * 92 ),
                                width: (MediaQuery
                                    .of(context)
                                    .size
                                    .width / 750) * 88.63,
                                height:(MediaQuery
                                    .of(context)
                                    .size
                                    .height / 1334) * 77.55,
                                child:const FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.contain,
                                  child:Icon(MyFlutterApp.camera_solid,color: Color.fromRGBO(240, 235, 227, 1)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ),
              SizedBox( // empty space
                height:(MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 48 ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

