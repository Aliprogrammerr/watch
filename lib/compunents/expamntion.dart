import 'package:intl/intl.dart';


extension IntExtention on int {
   String get seperateWithComma {
    final numbertformat = NumberFormat.decimalPattern();
    return numbertformat.format(this); 
   }
}