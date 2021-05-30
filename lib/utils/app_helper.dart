import 'package:intl/intl.dart';

class AppHelper{

  numberToRupiah(number){
   return  NumberFormat.currency(locale: 'id', symbol: "Rp ", decimalDigits: 0).format(number);
  }
  

}