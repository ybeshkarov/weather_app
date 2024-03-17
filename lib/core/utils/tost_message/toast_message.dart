import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract final class ToastMessage {
  static void showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
