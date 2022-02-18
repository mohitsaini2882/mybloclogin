import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void ToastPrinter(String message)async{
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      textColor: Colors.white,
      backgroundColor: Colors.grey
  );
}
void PrintToast(String message)async{
  await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      textColor: Colors.white,
      backgroundColor: Colors.grey
  );
}