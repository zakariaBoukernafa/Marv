import 'package:money2/money2.dart';

class FormatMoney {
  final Currency currency = Currency.create('USD', 2);

   String format(int val) => Money.fromInt(val, currency).toString();
}