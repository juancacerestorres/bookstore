import 'package:bookstore/common/styles/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomButton {
  static SizedBox button({
    required final Widget title,
    required void Function() onPressed,
    final bool enable = true,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: Theme(
        data: ThemeData(),
        child: TextButton(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            )),
            foregroundColor: MaterialStateProperty.all<Color>(CustomTheme().colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                enable ? CustomTheme().colors.darkBlue : CustomTheme().colors.darkBlue.withOpacity(0.5)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onPressed: enable ? onPressed : null,
          child: title,
        ),
      ),
    );
  }
}
