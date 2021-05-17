
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:credit_card_validator/validation_results.dart';

extension cardValidation on CreditCardValidator {
  String? isCardElementValid(ValidationResults result) {
    if (!result.isPotentiallyValid) {
      if (result.message == "") {
        return null;
      }
      return result.message;
    } else {
      return null;
    }
  }
}