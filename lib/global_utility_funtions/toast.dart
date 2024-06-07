import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

void showToast(
  String message, {
  ToastGravity gravity = ToastGravity.CENTER, 
  Toast toastLength = Toast.LENGTH_SHORT, 
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
