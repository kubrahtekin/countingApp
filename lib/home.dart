import 'package:counting_app/camera.dart';
import 'package:counting_app/icons.dart';
import 'package:counting_app/open.dart';
import 'package:flutter/material.dart';

import 'image.dart';

Color appBar = const Color.fromRGBO(87, 111, 114, 1);
bool control = false;
//bool isVisible = !false;
//ListItem dropdownValue = ListItem(title: ' ', isSelected: true, icon: const Icon(MyFlutterApp.circle_solid,color: Color.fromRGBO(87, 111, 114, 1), size: 24));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  ShowHide showBox = ShowHide(isVisible: false);
  ListItem dropdownValue = ListItem(title: ' ', isSelected: true, icon: const Icon(MyFlutterApp.circle_solid,color: Color.fromRGBO(87, 111, 114, 1), size: 24));


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,   // delete debug
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(228, 220, 207, 0.8),
        //backgroundColor: const Color.fromRGBO(125, 157, 156, 1) ,
      ),
      title: 'Counting App',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        //backgroundColor: const Color.fromRGBO(87, 111, 114, 1),
        appBar: AppBar(
          toolbarHeight: (MediaQuery
              .of(context)
              .size
              .height / 1334) * 602,  // 667
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
                  //margin: const EdgeInsets.only(right: 0.5),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
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
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(30),
                    dropdownColor: const Color.fromRGBO(228, 220, 207, 1),
                    value: dropdownValue.title,
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
                        showBox.setIsVisible(!(newValue == ' '));
                        dropdownValue.title = newValue!;
                        print(newValue);
                        //switch(newValue){
                        //    case 'paperclips' :
                        //      isVisible = !isVisible;
                        //    break;
                        //    default:
                        //      Navigator.push(
                        //        context,
                        //        MaterialPageRoute(builder: (context) => const SecondRoute()),
                        //    );
                        //    break;
                        //}
                        //Scaffold(
                        //    body: Container(
                        //      width: (MediaQuery
                        //          .of(context)
                        //          .size
                        //          .width / 750) * 750,
                        //      height: (MediaQuery
                        //          .of(context)
                        //          .size
                        //          .height / 1334) * 58,
                        //      color: const Color.fromRGBO(125, 157, 156, 1),
                        //    ),
                        //);
                      });
                    },
                    //hint: ListView.builder(
                    //    itemCount: _items.length,
                    //    itemBuilder: (_, index) {
                    //      return GestureDetector(
                    //        onTap: () {
                    //          for (int i = 0; i < _items.length; i++) {
                    //            setState(() {
                    //              if (index == i) {
                    //                _items[index].isSelected = true;
                    //              } else {
                    //                //the condition to change the highlighted item
                    //                _items[i].isSelected = false;
                    //              }
                    //            });
                    //          }
                    //        },
                    //        child: Container(
                    //          color: _items[index].isSelected
                    //              ? Colors.blueAccent
                    //              : Colors.white,
                    //          child: ListTile(
                    //            //i want to display different items for each list in the leading property.
                    //            leading: Icon(_items[index].icon),
                    //            title: Text(_items[index].title),
                    //          ),
                    //        ),
                    //      );
                    //    }),
                    items: <ListItem> [
                      ListItem(title: ' ', isSelected: true, icon: const Icon( MyFlutterApp.angle_right_solid, color: Color.fromRGBO(87, 111, 114, 1), size: 24)),
                      ListItem(title: 'paperclips', isSelected: false, icon: const Icon( MyFlutterApp.angle_right_solid, color: Color.fromRGBO(87, 111, 114, 1), size: 24)),
                      ListItem(title: 'fingers', isSelected: false, icon: const Icon( MyFlutterApp.angle_right_solid, color: Color.fromRGBO(87, 111, 114, 1), size: 24)),
                    ]
                        .map<DropdownMenuItem<String>>((ListItem value) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.centerLeft,
                        value: value.title,
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
                              if (value.title != ' ') value.icon,
                              FittedBox(
                                fit: BoxFit.contain,
                                child:Text(
                                  value.title,
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
                        onTap: () {
                          setState(() {
                            showBox.isVisible = true;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  //child: const ExpansionTileSample(),
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


        //******************
        // TODO: body part
        //*****************
        body: Visibility(
            visible: showBox.getIsVisible(),
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            maintainSemantics:true,
            child:Container(
              width: (MediaQuery
                  .of(context)
                  .size
                  .width / 750) * 750,
              height: (MediaQuery
                  .of(context)
                  .size
                  .height / 1334) * 1086,  //431
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0), // adjust to your liking
                  bottomRight: Radius.circular(30.0), // adjust to your liking
                ),
                color: Color.fromRGBO(125, 157, 156, 1),
              ),
              child:Center(
                child:Column(
                  children: <Widget>[
                    SizedBox(
                      height: (MediaQuery
                          .of(context)
                          .size
                          .height / 1334) * 718,  //51
                    ),
                    SizedBox(
                      height: (MediaQuery
                          .of(context)
                          .size
                          .height / 1334) * 51,
                      width: (MediaQuery
                          .of(context)
                          .size
                          .width / 750) * 517,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          'Choose the source of image:',
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
                          .height / 1334) * 75,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: (MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 186,
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 168,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all( Radius.circular(30),),
                            color: const Color.fromRGBO(87, 111, 114, 1),
                            border: Border.all(
                                color: const Color.fromRGBO(112, 112, 112, 1),
                                width: 1.0,
                                //style: BorderStyle.solid
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          child:TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ImagePage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [
                                Container(
                                  margin: const EdgeInsets.only(left: 5, right: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 0 , horizontal: 0),
                                  height: (MediaQuery
                                      .of(context)
                                      .size
                                      .height / 1334) * 102.87,
                                  width: (MediaQuery
                                      .of(context)
                                      .size
                                      .width / 750) * 117.36,
                                  child: const FittedBox(
                                    fit: BoxFit.contain,
                                    child: Icon(MyFlutterApp.image_solid,color: Color.fromRGBO(240, 235, 227, 1)),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  height: (MediaQuery
                                      .of(context)
                                      .size
                                      .height / 1334) * 33,
                                  width: (MediaQuery
                                      .of(context)
                                      .size
                                      .width / 750) * 92,
                                  child:FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'gallery',
                                      //textAlign: TextAlign.center,
                                      // make center y axis
                                      //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
                                      style: TextStyle(
                                          color: const Color.fromRGBO(228, 220, 207, 0.8),
                                          fontSize: 24 * MediaQuery
                                              .of(context)
                                              .textScaleFactor,
                                          fontFamily: 'PoppinsS'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ),
                        SizedBox(
                          height: (MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 186,
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 136,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          //margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          height: (MediaQuery
                              .of(context)
                              .size
                              .height / 1334) * 186,
                          width: (MediaQuery
                              .of(context)
                              .size
                              .width / 750) * 168,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all( Radius.circular(30),),
                            color: const Color.fromRGBO(87, 111, 114, 1),
                            border: Border.all(
                              color: const Color.fromRGBO(112, 112, 112, 1),
                              width: 1.0,
                              //style: BorderStyle.solid
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const CameraPage()));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [
                                Container(
                                  margin: const EdgeInsets.only(left: 5, right: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 0 , horizontal: 0),
                                  height: (MediaQuery
                                      .of(context)
                                      .size
                                      .height / 1334) * 106.9,
                                  width: (MediaQuery
                                      .of(context)
                                      .size
                                      .width / 750) * 122.18,
                                  child: const FittedBox(
                                    fit: BoxFit.contain,
                                    child: Icon(MyFlutterApp.camera_solid,color: Color.fromRGBO(240, 235, 227, 1)),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                  height: (MediaQuery
                                      .of(context)
                                      .size
                                      .height / 1334) * 33,
                                  width: (MediaQuery
                                      .of(context)
                                      .size
                                      .width / 750) * 102,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'camera',
                                      textAlign: TextAlign.center,
                                      // make center y axis
                                      //style: TextStyle(color: const Color.fromRGBO(228, 220, 207, 0.8), fontFamily: 'Poppins',fontSize: 72, height: (MediaQuery.of(context).size.height/1334)*101),
                                      style: TextStyle(
                                          color: const Color.fromRGBO(228, 220, 207, 0.8),
                                          fontSize: 24 * MediaQuery
                                              .of(context)
                                              .textScaleFactor,
                                          fontFamily: 'PoppinsS'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
        ),
        //******************************
        //body: Container(
        //  width: (MediaQuery
        //      .of(context)
        //      .size
        //      .width / 750) * 750,
        //  height: (MediaQuery
        //      .of(context)
        //      .size
        //      .height / 1334) * 431,
        //  decoration: const BoxDecoration(
        //    borderRadius: BorderRadius.only(
        //      bottomLeft: Radius.circular(30.0), // adjust to your liking
        //      bottomRight: Radius.circular(30.0), // adjust to your liking
        //    ),
        //    color: Color.fromRGBO(125, 157, 156, 1),
        //  ),
        //),
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

class ListItem {
  String title;
  bool isSelected;
  Icon icon;
  ListItem({
    required this.title,
    required this.isSelected,
    required this.icon,
  });
}

class ShowHide {
  bool isVisible;
  ShowHide({
    required this.isVisible,
  });
  bool getIsVisible(){
    return isVisible;
  }
  void setIsVisible(bool isV){
    isVisible = isV;
  }
}


class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate back to first route when tapped.
      },
      child: const Text('Go back!'),
    );
  }
}
