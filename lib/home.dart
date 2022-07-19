import 'package:flutter/material.dart';

Color appBar = const Color.fromRGBO(87, 111, 114, 1);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color.fromRGBO(228, 220, 207, 0.8)),
      title: 'Counting App',
      home: Scaffold(
        appBar:AppBar(
          toolbarHeight:  (MediaQuery.of(context).size.height/1334)*667, // helps get height from device
          backgroundColor: appBar, // change appbar color
          flexibleSpace:Center(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,  //min
              children:  <Widget>[
                SizedBox(    // empty space
                  height: (MediaQuery.of(context).size.height/1334)*53 ,
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height/1334)*101 ,
                  width: (MediaQuery.of(context).size.width/750)*498 ,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Counting App',
                      textAlign: TextAlign.center,    // make center y axis
                      //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
                      style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 72*MediaQuery.of(context).textScaleFactor, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                //const FittedBox(
                //  fit: BoxFit.fitWidth,
                //  child: Text(
                //  'Counting App',
                //  textAlign: TextAlign.center,    // make center y axis
                //  //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
                //  style: TextStyle(color: Color.fromRGBO(228, 220, 207, 0.8), fontSize: 72, fontFamily: 'Poppins'),
                //  ),
                //),
                SizedBox(    // empty space
                  height: (MediaQuery.of(context).size.height/1334)*154 ,
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height/1334)*51 ,
                  width: (MediaQuery.of(context).size.width/750)*496 ,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Choose the object to count:',
                      textAlign: TextAlign.center,    // make center y axis
                      //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
                      style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36 * MediaQuery.of(context).textScaleFactor, fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                //const Text(
                //  'Choose the object to count:',
                //  textAlign: TextAlign.center,    // make center y axis
                //  //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 36, height: (MediaQuery.of(context).size.height/1334)*51),
                //  style: TextStyle(color: Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36, fontFamily: 'Poppins'),
                //),
              ],
            ),
          ),
          //title: const Text(
          //    "Counting App",
          //    //textAlign: TextAlign.center,    // make center y axis
          //    style: TextStyle(color: Color.fromRGBO(228, 220, 207, 0.8), fontSize: 72, fontFamily: 'Poppins'),
          //  ),
          //flexibleSpace: const Center(
          //  child: Text(
          //    "Choose the object to count:",
          //    //textAlign: TextAlign.center,    // make center y axis
          //    style: TextStyle(color: Color.fromRGBO(228, 220, 207, 0.8), fontSize: 36, fontFamily: 'Poppins'),
          //  ),
          //),
          shape: const RoundedRectangleBorder(    // round appBar
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        // rounded navigation bar
        //**
        bottomNavigationBar: Container(
          height: (MediaQuery.of(context).size.height/1334)*78,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), // adjust to your liking
              topRight: Radius.circular(30.0), // adjust to your liking
            ),
            color: Color.fromRGBO(87, 111, 114, 1), // put the color here
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
