import 'package:flutter/material.dart';

class ConframPassTextField extends StatelessWidget {
  const ConframPassTextField({super.key, required this.confarmpasswordController});
  final TextEditingController confarmpasswordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: confarmpasswordController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "Password-confram"
      ),
      validator: (value){
        if(value==""||value==null){
          return "Password can't be empty";
        }
        return null;
      },
    );
  }
}
