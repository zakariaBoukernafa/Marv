import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:get/get.dart';
import 'package:ecommerce/utils/extensions/card_validator.dart';

class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find();
  final CreditCardValidator _ccValidator = CreditCardValidator();

  RxnString cardNumber = RxnString();
  RxnString cardExpiry = RxnString();
  RxnString cardHolderName = RxnString();
  RxnString cvv = RxnString();



  void createPaymentMethod(){
    
  }

  //validators
  String? get isCardValid {
    if (cardNumber.value != null) {
     return _ccValidator.validateCCNum(cardNumber.value!).isCardElementValid();
    }
  }



  String? get isCvvValid {
    if (cardNumber.value != null && cvv.value != null) {
      final ccNumResults = _ccValidator.validateCCNum(cardNumber.value!);
      return _ccValidator
          .validateCVV(cvv.value!, ccNumResults.ccType)
          .isCardElementValid();
    }
  }

  String? get isExpDateValid {
    if (cardExpiry.value != null) {
      return _ccValidator
          .validateExpDate(cardExpiry.value!)
          .isCardElementValid();
    }
  }
}
