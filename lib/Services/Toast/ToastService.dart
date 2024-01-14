import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void errorToast(String errMsg) {
    try {
      Fluttertoast.showToast(
            msg: errMsg,
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0
        );
    } catch(ex) {
      debugPrint(ex.toString());
    }
  }

  static void successToast(String succMsg) {
    try {
    Fluttertoast.showToast(
          msg: succMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } catch(ex) {
      debugPrint(ex.toString());
    }
  }
}