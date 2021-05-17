import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:get/get.dart';
import 'package:ecommerce/utils/extension_methods.dart';
class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find();
  final CreditCardValidator _ccValidator = CreditCardValidator();

  RxnString cardNumber = RxnString();
  RxnString cardExpiry = RxnString();
  RxnString cardHolderName = RxnString();
  RxnString cvv = RxnString();

  //validators
  String? get isCardValid {
    if (cardNumber.value != null) {
      _ccValidator
          .isCardElementValid(_ccValidator.validateCCNum(cardNumber.value!));
    }
  }

  String? get isCvvValid {
    if (cardNumber.value != null && cvv.value != null) {
      final ccNumResults = _ccValidator.validateCCNum(cardNumber.value!);
      return _ccValidator.isCardElementValid(
          _ccValidator.validateCVV(cvv.value!, ccNumResults.ccType));
    }
  }

  String? get isExpDateValid {
    if (cardExpiry.value != null) {
      return _ccValidator
          .isCardElementValid(_ccValidator.validateExpDate(cardExpiry.value!));
    }
  }
}


