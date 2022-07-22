import 'package:counting_app/icons.dart';
import 'package:flutter/material.dart';

Color appBar = const Color.fromRGBO(87, 111, 114, 1);
final List<String> _animals = ['paperclips', 'fingers',];
String? _selectedAnimal;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              .height / 1334) * 667,
          // helps get height from device
          backgroundColor: appBar,
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
                //const FittedBox(
                //  fit: BoxFit.fitWidth,
                //  child: Text(
                //  'Counting App',
                //  textAlign: TextAlign.center,    // make center y axis
                //  //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
                //  style: TextStyle(color: Color.fromRGBO(228, 220, 207, 0.8), fontSize: 72, fontFamily: 'Poppins'),
                //  ),
                //),
                SizedBox( // empty space
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 154,
                ),
                SizedBox(
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 51,
                  width: (MediaQuery
                      .of(context)
                      .size
                      .width / 750) * 496,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Choose the object to count:',
                      textAlign: TextAlign.center,
                      // make center y axis
                      //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
                      style: TextStyle(
                          color: const Color.fromRGBO(228, 220, 207, 0.8),
                          fontSize: 36 * MediaQuery
                              .of(context)
                              .textScaleFactor,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 39,
                ),
                //*****************************************************
                // DROP DOWN BUTTON
                //*****************************************************
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 15),
                  width: (MediaQuery
                    .of(context)
                    .size
                    .width / 750) * 592,
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height / 1334) * 58,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(228, 220, 207, 1),
                      borderRadius: BorderRadius.circular(30)),
                  child: const MyStatefulWidget(),
                ),
                //**************************************************************
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
              .height / 1334) * 78,
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


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = ' ';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(30),
      dropdownColor: const Color.fromRGBO(228, 220, 207, 1),
      value: dropdownValue,
      icon: const Icon(
        MyFlutterApp.caret_down_solid,
        color: Color.fromRGBO(87, 111, 114, 1),
      ),
      isExpanded: true,
      elevation: 24,  // ?
      style: const TextStyle(color: Color.fromRGBO(87, 111, 114, 1)),
      underline: Container(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          if(dropdownValue != ' '){
            // TODO: main-screen-3
          }
        });
      },
      items: <String>[' ','paperclips', 'fingers']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          alignment: Alignment.centerLeft,
          value: value,
          child:SizedBox(
            width: (MediaQuery
                .of(context)
                .size
                .width / 750) * 592,
            height: (MediaQuery
                .of(context)
                .size
                .height / 1334) * 33,
            child:Row(
              children: <Widget>[
                // TODO: dropdown buttonu main-screen-2 ye göre güncelle
                // if (value != ' ') const Icon(MyFlutterApp.caret_down_solid, color: Color.fromRGBO(87, 111, 114, 1), size: 24) else const Align(alignment: Alignment.centerRight, child: Icon(MyFlutterApp.caret_down_solid, color: Color.fromRGBO(87, 111, 114, 1), size: 24)),
                if (value != ' ') const Icon(MyFlutterApp.angle_right_solid, color: Color.fromRGBO(87, 111, 114, 1), size: 24),
                FittedBox(
                  fit: BoxFit.contain,
                  child:Text(
                    value,
                    textAlign: TextAlign.left,
                    // make center y axis
                    //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
                    style: TextStyle(
                        color: const Color.fromRGBO(87, 111, 114, 1),
                        fontSize: 24 * MediaQuery
                            .of(context)
                            .textScaleFactor,
                        fontFamily: 'PoppinsS'),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
        height: (MediaQuery
            .of(context)
        .size
        .height / 1334) * 750,
        // helps get height from device
         decoration: const BoxDecoration(
           borderRadius: BorderRadius.only(
             bottomLeft: Radius.circular(30.0), // adjust to your liking
             bottomRight: Radius.circular(30.0), // adjust to your liking
           ),
           color: Color.fromRGBO(125, 157, 156, 1),// put the color here
         ),
       ),
    );
  }
}


