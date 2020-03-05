import 'package:flutter/material.dart';
import 'package:firstapp_bloc_api/styles/styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MessageDialog {
  static showMsgDialog({
    BuildContext context,
    String title,
    String filenameError = "",
    String desc = "",
    AlertType alertTtyle,
  }) {
    Alert(
      context: context,
      type: alertTtyle,
      content: Text(
        filenameError,
        style: StylesText.style13Black,
      ),
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromARGB(255, 20,131,196),
        ),
      ],

    ).show();
  }
}
