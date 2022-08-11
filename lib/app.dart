import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'open.dart';

Color cream = const Color(0xE4DCCFCC);


class CountingApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const CountingApp({Key? key,required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counting App',
      initialRoute: '/open',    // start page
      routes: {
        '/open': (BuildContext context) => OpenPage(cameras: cameras),
      },
    );
  }
}


