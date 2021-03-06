import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'screen/splash/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins-Regular',
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
