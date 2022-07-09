import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String title;
  TextEditingController controller;
  bool isActive = true;

  CustomTextField(this.title, this.controller, {Key? key}) : super(key: key);
  CustomTextField.withState(this.title, this.controller, this.isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        decoration: InputDecoration(labelText: title),
        enabled: isActive,
        controller: controller,
        validator: (value){
          if (!isActive) return null;
          if (value != null) {
            if (value.isEmpty) return 'Необходимо заполнить поле';
            if (double.tryParse(value) == null) return 'Необходимо ввести число';
          }
          return null;
        },
      ),
    );
  }
}
