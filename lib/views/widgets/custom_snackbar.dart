import 'package:flutter/material.dart';

mixin CustomSnackbar {
  void toShowSnackBarCustom(BuildContext context,
      {required Widget snackBarContent, Color? color}) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: snackBarContent,
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
