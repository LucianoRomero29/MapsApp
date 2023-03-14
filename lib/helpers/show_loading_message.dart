import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoadingMessage(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      builder: (context) => const CupertinoAlertDialog(
        title: Text("Wait please..."),
        content: CupertinoActivityIndicator(),
      ),
    );
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
        title: const Text("Wait please..."),
        content: Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: const [
              Text("Calculating route"),
              SizedBox(height: 15),
              CircularProgressIndicator(strokeWidth: 3, color: Colors.black)
            ],
          ),
        )),
  );

  return;
}
