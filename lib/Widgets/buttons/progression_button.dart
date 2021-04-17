import 'package:ecommerce/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

class ProgressionButton extends StatelessWidget {
  final ButtonState? state;
  final VoidCallback? function;
  final String? idleText;
  final String? loadingText;
  final String? failText;
  final String? successText;
  final Icon? idleIcon;
  final IconedButton? failIcon;
  final IconedButton? successIcon;
  final CircularProgressIndicator? circularProgressIndicator;
  final double minWidth;
  final double maxWidth;
  final double radius;
  final double height;
  final double iconPadding;

  final ProgressIndicator? progressIndicator;
  final double? progressIndicatorSize;
  final Function?  onAnimationEnd;
  final TextStyle? textStyle;
  final MainAxisAlignment progressIndicatorAligment;
  final EdgeInsets padding;
   const ProgressionButton(
      {this.state = ButtonState.idle,
      required this.function,
      required this.successText,
      required this.idleText,
      required this.loadingText,
      required this.failText,
      this.idleIcon,
      this.failIcon,
      this.successIcon,
      this.circularProgressIndicator,
      this.minWidth = 58.0,
      this.maxWidth = 170.0,
      this.radius = 16.0,
      this.height = 53.0,
      this.progressIndicatorSize = 35.0,
      this.progressIndicatorAligment = MainAxisAlignment.spaceBetween,
      this.padding = EdgeInsets.zero,
      this.onAnimationEnd,
      this.textStyle,
      this.iconPadding = 4.0,

      this.progressIndicator});

  @override
  Widget build(BuildContext context) {
    return ProgressButton.icon(
        iconedButtons: {
          ButtonState.idle: IconedButton(
            text: idleText,
            icon: idleIcon ?? const Icon(Icons.send, color: Colors.white),
            color: green,
          ),
          ButtonState.loading: IconedButton(
              text: loadingText, color: Colors.deepPurple.shade700),
          ButtonState.fail: failIcon ??
              IconedButton(
                  text: failText,
                  icon: const Icon(Icons.cancel, color: Colors.white),
                  color: Colors.red.shade300),
          ButtonState.success: successIcon ??
              IconedButton(
                  text: successText,
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  ),
                  color: Colors.green.shade400),
        },
        progressIndicator:
            circularProgressIndicator ?? const CircularProgressIndicator(),
        radius: radius,
        height: height,
        minWidth: minWidth,
        padding: padding,
        animationEnd: onAnimationEnd,
        iconPadding: iconPadding,
        maxWidth: maxWidth,
        progressIndicatorAligment: progressIndicatorAligment,
        progressIndicatorSize: progressIndicatorSize,
        textStyle: textStyle,
        onPressed: function,
        state: state);
  }
}
