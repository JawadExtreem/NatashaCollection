import 'package:flutter/material.dart';

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode curruntFocus = FocusScope.of(context);

    if (!curruntFocus.hasPrimaryFocus) {
      curruntFocus.unfocus();
    }
  }
}
