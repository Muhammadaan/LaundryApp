import 'package:flutter/material.dart';
import 'package:laundry/screen/home_screen/home_screen.dart';
import './splash.dart';

abstract class SplashViewModel extends State<Splash> {
  // Add your state and logic here

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {

       Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
    });
  }
}
