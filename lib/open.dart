import 'package:camera/camera.dart';
import 'package:counting_app/home.dart';
import 'package:counting_app/icons.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class OpenPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const OpenPage({Key? key,required this.cameras}) : super(key: key);

  @override
  OpenPageState createState() => OpenPageState();
}
class OpenPageState extends State<OpenPage> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                HomePage(cameras: widget.cameras)
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counting App',
      // TODO: add this part logo (-)
      //home: const Center(
      //  child: Text(
      //    'novadsa',
      //    textAlign: TextAlign.center,
      //  ),
      //),
      //home: SvgPicture.network(
      //  dogUrl,
      //  placeholderBuilder: (context) => const CircularProgressIndicator(),
      //  height: 128.0,
      //),
      home: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), //apply padding to some sides only
          decoration: const BoxDecoration(color: Color.fromRGBO(228, 220, 207, 1)),
          child:Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left:0, bottom: 0, right: 0, top:0),
                  height: (MediaQuery.of(context).size.height/1334)*61 ,
                  width: (MediaQuery.of(context).size.width/750)*462 ,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.baseline,
                    //mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      //Image.asset('assets/images/novadsa.png'),  //, width: (MediaQuery.of(context).size.width/750)*61 , height: (MediaQuery.of(context).size.height/1334)*61
                      Container(
                        margin: const EdgeInsets.only(left: 0, right: 0,bottom: 7.5,top: 0),
                        padding: const EdgeInsets.symmetric(vertical: 0 , horizontal: 0),
                        height: (MediaQuery
                            .of(context)
                            .size
                            .height / 1334) * 61,
                        width: (MediaQuery
                            .of(context)
                            .size
                            .width / 750) * 61,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child:Stack(children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                margin: EdgeInsets.all(5), // Modify this till it fills the color properly
                                color: Colors.white, // Color
                              ),
                            ),
                            const Icon(
                               MyFlutterApp.novadsa_logo, // Icon
                              color: Color.fromRGBO(0,189,172,1),
                            ),
                          ]),
                          //child: Icon(MyFlutterApp.novadsa_logo, color:  Color.fromRGBO(0,189,172,1),),
                        ),
                      ),
                      //const Icon(MyFlutterApp.novadsa_logo, color:  Color.fromRGBO(0,189,172,1),),
                      FittedBox(
                        fit: BoxFit.contain,
                        child:RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(text: " nova", style: TextStyle(decoration: TextDecoration.none, color: Color.fromRGBO(0,189,172,1), fontSize: 92 , fontFamily: 'PoppinsSemibold',height: 0.8)),
                              TextSpan(text: "DSA", style: TextStyle(decoration: TextDecoration.none, color: Color.fromRGBO(0,189,172,1), fontSize: 72 , fontFamily: 'PoppinsSemibold',height: 0.8)),
                            ],
                          ),
                        ),
                      ),
                      // MediaQuery.of(context).textScaleFactor made font flexiblity
                      //Text(
                      //  " nova",
                      //  textAlign: TextAlign.justify,
                      //  style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(87, 111, 114, 1), fontSize: 92 * MediaQuery.of(context).textScaleFactor, fontFamily: 'Poppins'),
                      //),
                      //Text(
                      //  "DSA",
                      //  //textDirection: TextDirection.ltr,
                      //  textAlign: TextAlign.justify,
                      //  style: TextStyle(decoration: TextDecoration.none, color: const Color.fromRGBO(87, 111, 114, 1), fontSize: 72 * MediaQuery.of(context).textScaleFactor, fontFamily: 'Poppins'),   // 72 -> font size
                      //)
                    ],
                  ),
                ),

                //const Text(
                //  'nova',
                //  //maxLines: 5,
                //  //textAlign: TextAlign.center,
                //  style: TextStyle(color: Color.fromRGBO(87, 111, 114, 1), fontSize: 92, fontFamily: 'Poppins'),
                //),
              ]
          )
        //child: Stack(children: <Widget>[
        //  Center(
        //    child: Image.asset('assets/images/novadsa.png'),
        //    ),
        //  Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //    Container(
        //        //width: double.infinity,
        //        color: const Color.fromRGBO(228, 220, 207, 0.8),
        //        //padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        //        child: const Text(
        //          'nova',
        //          //maxLines: 5,
        //          textAlign: TextAlign.center,
        //          style: TextStyle(color: Color.fromRGBO(87, 111, 114, 1), fontSize: 72, fontFamily: 'Poppins'),
        //        )),
        //  ]),
        //]),
      ),
    );
  }
}
