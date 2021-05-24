import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:ecommerce/Widgets/TextFields/custom_text_field.dart';
import 'package:ecommerce/Widgets/animations/circular_indicator.dart';
import 'package:ecommerce/screens/payment/checkout_controller.dart';
import 'package:ecommerce/utils/app_state.dart';
import 'package:ecommerce/utils/card_input_formatter.dart';
import 'package:ecommerce/utils/expiry_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:ecommerce/utils/extensions/strings.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool showBack = false;

  final FocusNode node = FocusNode();

  @override
  void initState() {
    super.initState();
    node.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                CreditCard(
                    cardNumber: CheckoutController.to.cardNumber.value ?? "",
                    cardExpiry: CheckoutController.to.cardExpiry.value ?? "",
                    cardHolderName:
                        CheckoutController.to.cardHolderName.value ?? "",
                    cvv: CheckoutController.to.cvv.value ?? "",
                    showBackSide: node.hasFocus,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    textName: 'Name'),

                SizedBox(
                  height: Get.height * 0.05,
                ),
                CustomTextFormField(
                    labelText: "Card Number",
                    hintText: "1234 5678 7890 2020",
                    onChanged: (value) =>
                        CheckoutController.to.cardNumber.value = value,
                    maxLength: 19,
                    textInputType: TextInputType.number,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardInputFormatter()
                    ],
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => node.nextFocus(),
                    errorText: CheckoutController.to.isCardValid),
                Text(
                  CheckoutController.to.paymentError.value
                      .filterPaymentErrorMessage() ??
                      "",
                  style: const TextStyle(color: Colors.red),
                ),
                CustomTextFormField(
                  labelText: "Card Holder",
                  hintText: "Aphelios Zoe",
                  onChanged: (value) =>
                      CheckoutController.to.cardHolderName.value = value,
                  textInputType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => node.nextFocus(),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      child: CustomTextFormField(
                        labelText: "Expiry date",
                        hintText: "06/25",
                        onChanged: (value) =>
                            CheckoutController.to.cardExpiry.value = value,
                        textInputType: TextInputType.number,
                        maxLength: 5,
                        errorText: CheckoutController.to.isExpDateValid,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          ExpiryInputFormatter()
                        ],
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => node.nextFocus(),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.4,
                      child: CustomTextFormField(
                        labelText: "CVV",
                        hintText: "123",
                        onChanged: (value) =>
                            CheckoutController.to.cvv.value = value,
                        textInputType: TextInputType.number,
                        focusNode: node,
                        maxLength: 3,
                        errorText: CheckoutController.to.isCvvValid,
                        textInputAction: TextInputAction.done,
                        onEditingComplete: () => node.unfocus(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.1,
                ),
                ElevatedButton(
                    onPressed: () => CheckoutController.to.createOrder(),
                    child:
                        CheckoutController.to.appState.value == AppState.LOADING
                            ?  CircularIndicator(
                              )
                            : const Text("PAY NOW")),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
