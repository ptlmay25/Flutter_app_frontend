import 'package:intl/intl.dart';

class Formatter{

  String numberFormat(dynamic number){
    return NumberFormat.currency(locale: "en_IN", symbol: "").format(number);
  }
}