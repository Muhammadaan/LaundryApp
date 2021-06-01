import 'package:flutter/material.dart';
import './view_detail_transaksi_view.dart';

class ViewDetailTransaksi extends StatefulWidget {

  final String idDoc;

  const ViewDetailTransaksi({Key key, this.idDoc}) : super(key: key);
  
  @override
  ViewDetailTransaksiView createState() => new ViewDetailTransaksiView();
}
  
