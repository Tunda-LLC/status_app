import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

const Color _APP_GREEN = Color(0xff4AD393);
const Color _APP_RED = Color(0xffD83A43);

void showSuccessToast(String msg, context) {
  Toast.show(msg, context,
      duration: Toast.LENGTH_LONG,
      backgroundColor: _APP_GREEN,
      gravity: Toast.BOTTOM);
}

void showToast(String msg, context) {
  Toast.show(msg, context,
      duration: Toast.LENGTH_LONG,
      // backgroundColor: APP_RED,
      gravity: Toast.BOTTOM);
}

void showTopToast(String msg, context) {
  Toast.show(msg, context,
      duration: Toast.LENGTH_LONG,
      // backgroundColor: APP_RED,
      gravity: Toast.TOP);
}

void showErrorToast(String msg, context) {
  Toast.show(msg, context,
      duration: Toast.LENGTH_LONG,
      backgroundColor: _APP_RED,
      gravity: Toast.BOTTOM);
}
