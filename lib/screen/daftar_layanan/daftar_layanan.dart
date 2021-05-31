import 'package:flutter/material.dart';
import './daftar_layanan_view.dart';

class DaftarLayanan extends StatefulWidget {
  final String nama;

  const DaftarLayanan({Key key, this.nama}) : super(key: key);
  @override
  DaftarLayananView createState() => new DaftarLayananView();
}
  
