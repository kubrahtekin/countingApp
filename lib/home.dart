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
          backgroundColor: appBar,      // change appbar color
          title: const Center(    // make center x axis
            child: Text(
              "Counting App",
              textAlign: TextAlign.center,    // make center y axis
              style: TextStyle(color: Color.fromRGBO(228, 220, 207, 0.8), fontSize: 72),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        // rounded navigation bar
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
