import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:credit_card_validator/validation_results.dart';

extension cardValidation on ValidationResults {
  String? isCardElementValid() {
    if (message == "") {
      return null;
    }

    return message;
  }
}
