import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final String dogUrl = "https://www.svgrepo.com/show/2046/dog.svg";
final String dogFoodUrl = "https://www.svgrepo.com/show/3682/dog-food.svg";

class OpenPage extends StatelessWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(228, 220, 207, 0.8)),
      title: 'Counting App',
      // TODO: add this part logo (-)
      //home: const Center(
      //  child: Text(
      //    'novadsa',
      //    textAlign: TextAlign.center,
      //  ),
      //),
      home: SvgPicture.network(
        dogUrl,
        placeholderBuilder: (context) => const CircularProgressIndicator(),
        height: 128.0,
      ),
      //child: SvgPicture.asset('assets/images/logo.svg',
      //  //color: const Color.fromRGBO(228, 220, 207, 0.8)
      //),
    );
  }
}
