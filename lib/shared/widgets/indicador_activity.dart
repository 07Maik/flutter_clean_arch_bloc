import 'package:flutter/material.dart';

class ActivityIndicator {
  String message;
  ActivityIndicator({this.message = "Proccessing..."});

  showActivityIndicator(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
              content: Row(children: [
            const CircularProgressIndicator(),
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              child: Text(message),
            )
          ])));

  hideActivityIndicator(BuildContext context) {
    Navigator.pop(context);
  }
}
