import 'dart:io';
import 'package:camera/camera.dart';
import 'package:counting_app/icons.dart';
import 'package:counting_app/result.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'camera.dart';
import 'home.dart';


class ImagePage extends StatelessWidget {
  final String? item;
  final File? image;
  const ImagePage({Key? key, required this.image, required this.cameras, required this.item}) : super(key: key);
  final List<CameraDescription> cameras;


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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage(cameras: cameras)));
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
                            color: const Color.fromRGBO(228, 220, 207, 0.8),
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
                          TextSpan(text: "Count the ", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsRegular')),
                          //TextSpan(text: "paperclips", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsSemibold')),
                          TextSpan(text: item, style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsSemibold')),
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
        body:Center(
          child:Container(
            alignment: Alignment.center,
            child:image != null ? Image.file(image!,fit: BoxFit.fill,): const Text("No image selected"),
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
                onTap: () async {
                  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if(image == null) return;
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ImagePage(image: this.image, cameras: cameras,item: item,)));
                },
                child: SizedBox( // empty space
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              image: image, cameras: cameras,item: item,)));
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
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 5, color: const Color.fromRGBO(125, 157, 156, 1)),
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CameraPage(
                              cameras: cameras,item: item,)));
                },
                child: SizedBox( // empty space
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
                    child: Icon( MyFlutterApp.camera_solid, color: Color.fromRGBO(240, 235, 227, 1)),
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
        ),
      ),
    );
  }
}

class ProgressBarHandler {
  late Function pickImage; // will point to widget show method
}
