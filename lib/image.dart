import 'package:counting_app/icons.dart';
import 'package:flutter/material.dart';


class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,   // delete debug
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(228, 220, 207, 0.8)),
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
                          fontFamily: 'Poppins'),
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
                          TextSpan(text: "Count the ", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'Poppins')),
                          TextSpan(text: "paperclips", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'PoppinsS')),
                          TextSpan(text: ":", style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor , fontFamily: 'Poppins')),
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
              SizedBox( // empty space
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
                          style: TextStyle(fontSize: 36,color: Color.fromRGBO(87, 111, 114, 1),fontFamily: 'Poppins'), //size:55
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
                    .width / 750) * 120.32,
                height:(MediaQuery
                    .of(context)
                    .size
                    .height / 1334) * 157 ,
              ),
              SizedBox( // empty space
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
