import 'package:flutter/material.dart';
import 'package:laundry/utils/app_contant.dart';
import './splash_view_model.dart';

class SplashView extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(icWasher, width: 100,),
            SizedBox(height: 10,),
            Text("Laundry")
          ],
        ),
      ),
    );
  }
}
