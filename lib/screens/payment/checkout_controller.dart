import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find();
  final CreditCardValidator _ccValidator = CreditCardValidator();

  RxnString cardNumber = RxnString();
  RxnString cardExpiry = RxnString();
  RxnString cardHolderName = RxnString();
  RxnString cvv = RxnString();

  String? get isCardValid {
    if (cardNumber.value != null) {
      final ccNumResults = _ccValidator.validateCCNum(cardNumber.value!);
      if (ccNumResults.isPotentiallyValid) {
        if (ccNumResults.message == "") {
          return null;
        }
        return ccNumResults.message;
      } else {
        return null;
      }
    }
  }

  String? get isCvvValid {
    if (cardNumber.value != null && cvv.value != null) {
      final ccNumResults = _ccValidator.validateCCNum(cardNumber.value!);
      final cvvResults =
          _ccValidator.validateCVV(cvv.value!, ccNumResults.ccType);

      if (cvvResults.isPotentiallyValid) {
        if (cvvResults.message == "") {
          return null;
        }
        return cvvResults.message;
      } else {
        return null;
      }
    }
  }

  String? get isExpDateValid {
    if (cardExpiry.value != null) {
      final expDateResults = _ccValidator.validateExpDate(cardExpiry.value!);

      if (!expDateResults.isPotentiallyValid) {
        if (expDateResults.message == "") {
          return null;
        }
        return expDateResults.message;
      } else {
        return null;
      }
    }
  }
}
