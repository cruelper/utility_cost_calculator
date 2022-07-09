import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, double el, double water, double gas) {
  Widget okButton = TextButton(
    child: const Text("Опять без денег("),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Расчитанная плата"),
    content: Text("За электричество: ${getFormatDouble(el)}р \n "
        "За воду: ${getFormatDouble(water)}р \n"
        "За газ: ${getFormatDouble(gas)}р \n"
        "Итого: ${getFormatDouble(el+water+gas)}р"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String getFormatDouble(double num){
  return ((num * 100).round() / 100).toString();
}