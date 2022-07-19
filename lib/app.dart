import 'package:flutter/material.dart';

import 'open.dart';
import 'home.dart';

Color cream = const Color(0xE4DCCFCC);


class CountingApp extends StatelessWidget {
  const CountingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counting App',
      initialRoute: '/open',    // start page
      routes: {
        '/open': (BuildContext context) => const OpenPage(),
        // first
        '/home': (BuildContext context) => const HomePage(),
        // second
      },

    );
  }
}


