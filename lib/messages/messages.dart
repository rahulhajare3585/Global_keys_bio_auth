import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Messages {
  void ShowToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // Can be LENGTH_LONG as well
      gravity:
          ToastGravity.BOTTOM, // You can change position (BOTTOM, TOP, CENTER)
      timeInSecForIosWeb: 1, // Duration in iOS/Web (1 second is default)
      backgroundColor: Colors.black, // Background color
      textColor: Colors.white, // Text color
      fontSize: 16.0, // Font size
    );
  }
}
