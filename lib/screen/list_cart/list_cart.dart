import 'package:flutter/material.dart';
import './list_cart_view.dart';

class ListCart extends StatefulWidget {
  final List listlayanan;
  final int durasi;
  final String nama;
  final int totalHarga;

  const ListCart({Key key, this.listlayanan, this.durasi, this.nama, this.totalHarga}) : super(key: key);

  

  @override
  ListCartView createState() => new ListCartView();
}
