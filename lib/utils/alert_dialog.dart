import 'package:flutter/material.dart';
import 'package:table_schedule_oblenergo/utils/colors.dart';

import '../helpers/local_notification.dart';

Widget alertDialog(BuildContext context){
  TextEditingController notification_descrp = TextEditingController();
  bool _validate = false;
  return AlertDialog(
    backgroundColor: AppColors.textColorLogin,
    title: const Text('Set notification options', style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
    content: Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: notification_descrp,
        decoration: InputDecoration(
          errorText: _validate ? 'Value Can\'t Be Empty' : null,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(20)
              ),
              borderSide: BorderSide(color: Color(0xFFA9ABB0), width: 2),
            ),
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            labelText: 'Enter Description',
            labelStyle: const TextStyle(
                color: Color(0xFFA9ABB0)),
            enabled: true),
        autocorrect: false,
        textInputAction: TextInputAction.done,
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          NotificationService().showNotification(
              1, 'Notification!', notification_descrp.text);
          //notification_descrp.text.isEmpty ? _validate = true : _validate = false;
          //Navigator.pop(context, 'OK');
        },
        child: const Text('OK', style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}