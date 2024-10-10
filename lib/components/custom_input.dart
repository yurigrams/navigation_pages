import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  String labelText;
  bool obscure;
  // TextEditingController controller;


  CustomInput({super.key,
    required this.labelText,
    this.obscure = false,
    // required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          filled: true,
          fillColor: Colors.green
        ),
      ),
    );
  }
}
