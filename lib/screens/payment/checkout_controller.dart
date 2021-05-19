import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:ecommerce/Controllers/gql_controller.dart';
import 'package:ecommerce/Controllers/user_controller.dart';
import 'package:ecommerce/graphql/mutations.dart';
import 'package:ecommerce/theme/colors.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ecommerce/utils/extensions/card_validator.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:ecommerce/utils/extensions/strings.dart';

class CheckoutController extends GetxController {
  static CheckoutController get to => Get.find();
  final CreditCardValidator _ccValidator = CreditCardValidator();
  final appState = Rx<AppState>(AppState.IDLE);

  RxnString cardNumber = RxnString();
  RxnString cardExpiry = RxnString();
  RxnString cardHolderName = RxnString();
  RxnString cvv = RxnString();
  late PaymentMethod _paymentMethod;
  RxString paymentError = RxString("");

  @override
  void onInit() {
    super.onInit();
    StripePayment.setOptions(StripeOptions(
        publishableKey: env['NEXT_PUBLIC_STRIP_KEY'],
        merchantId: "marv",
        androidPayMode: 'test'));
  }

  Future<void> createPaymentMethod() async {
    await StripePayment.createPaymentMethod(PaymentMethodRequest(
            card: CreditCard(
                name: cardHolderName.value,
                number: cardNumber.value,
                expMonth: cardExpiry.value!.slipitAtSlash()[0],
                expYear: cardExpiry.value!.slipitAtSlash()[1],
                cvc: cvv.value)))
        .then((paymentMethod) {
      _paymentMethod = paymentMethod;
    }).catchError((error) {
      paymentError.value = error.toString();
      appState.value = AppState.ERROR;
    });
  }

  Future<void> createOrder() async {
    if (validateForms) {
      appState.value = AppState.LOADING;
      await createPaymentMethod();
      if (appState.value == AppState.ERROR) {
        return;
      } else {
        await GqlController.to.httpClient.post(
          gql: CREATE_ORDER_MUTATION,
          variables: {"token": _paymentMethod.id!},
        ).then((value) async {
          await UserController.to.fetchCurrentUser();
          Get.back();
          Get.snackbar("Sucess", "Order proceeded successfully",
              colorText: white, backgroundColor: green,margin: const EdgeInsets.only(top: 24.0));
        });
        clearForms();
        appState.value = AppState.DONE;
      }
    }
  }

  void clearForms() {
    cardHolderName.value = null;
    cardNumber.value = null;
    cardExpiry.value = null;
    cvv.value = null;
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

  bool get validateForms =>
      isExpDateValid == null &&
      isCvvValid == null &&
      isCardValid == null &&
      cardHolderName.value != null;
}
