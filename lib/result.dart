import 'dart:convert';
//import 'dart:html';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:counting_app/icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

import 'camera.dart';
import 'home.dart';
import 'image.dart';

Future<Count> fetchCount() async {
  final response = await http.get(Uri.parse('https://mocki.io/v1/347c7334-edfb-47ef-b446-7afad578c39c'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Count.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Count {

  final String imageName;
  final String item;
  final int count;

  const Count({
    required this.imageName,
    required this.item,
    required this.count,
  });

  factory Count.fromJson(Map<String, dynamic> json) {
    return Count(
      imageName: json['imageName'],
      item: json['item'],
      count: json['count'],
    );
  }
}
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
  late Future<Count> futureCount;
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
    inputImage = InputImage.fromFile(File(widget.image!.path));
    Object1 on1 = Object1();
    objects = await on1.objectDetector.processImage(inputImage);
    on1.objectDetector.close();
  }

  @override
  void initState() {
    super.initState();
    futureCount = fetchCount();
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
                        //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
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
                //child: const FittedBox(
                //  fit: BoxFit.contain,
                //  child: Icon( MyFlutterApp.image_solid, color: Color.fromRGBO(240, 235, 227, 1)),
                //),
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
                  //shape: BoxShape.circle,
                  //borderRadius: BorderRadius.circular(100),
                  //border: Border.all(width: 5, color: const Color.fromRGBO(125, 157, 156, 1)),
                  //color: const Color.fromRGBO(240, 235, 227, 1),
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
                                      //TextSpan(text: snapshot.data!.count.toString(), style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(240, 235, 227, 1), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'RobotoBold')),
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

                //child: FittedBox(
                //  fit: BoxFit.contain,
                //  child: Stack(
                //    alignment: Alignment.center,
                //    children: const <Widget>[
                //      Icon(
                //        MyFlutterApp.circle_solid,
                //        size: 200,
                //        color: Color.fromRGBO(228, 220, 207, 1),
                //      ),
                //      Text(
                //        "count",
                //        style: TextStyle(fontSize: 36,color: Color.fromRGBO(87, 111, 114, 1),fontFamily: 'Poppins'), //size:55
                //      ),
                //    ],
                //  ),
                //),
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
          )

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

