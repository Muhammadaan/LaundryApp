import 'package:flutter/material.dart';
import './list_cart_view.dart';

class ListCart extends StatefulWidget {
  final List listlayanan;

  const ListCart({Key key, this.listlayanan}) : super(key: key);

  

  @override
  ListCartView createState() => new ListCartView();
}
