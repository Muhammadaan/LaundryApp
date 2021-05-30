import 'package:flutter/material.dart';
import 'package:laundry/utils/app_contant.dart';


class ButtonTextCustom extends StatelessWidget {
  final String label;
  final Color clr;
  final Function press;

  const ButtonTextCustom(
      {Key key, this.label, this.clr = mainColor, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: clr,
          onSurface: Colors.white,
          minimumSize: Size(double.infinity, 50)),
    );
  }
}
