import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'app.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  runApp(CountingApp(cameras: cameras));
}

