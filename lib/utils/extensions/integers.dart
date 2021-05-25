import 'package:money2/money2.dart';

extension IntegersOperations on int {
  String formatMoney() =>
      Money.fromInt(this, Currency.create('USD', 2)).toString();
}
