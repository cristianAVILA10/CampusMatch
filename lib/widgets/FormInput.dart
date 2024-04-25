import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText ;
  const FormInput({super.key, required this.controller, required this.hintText, required this.keyboardType, required this.obscureText});
  @override
  Widget build(BuildContext context) {

     final Size = MediaQuery.of(context).size;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.symmetric(horizontal: Size.width * 0.05),
      margin: EdgeInsets.symmetric(horizontal: Size.width * 0.05),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType, //TextInputType.visiblePassword,
        style: TextStyle(fontSize: 16),
        obscureText: obscureText, // Oculta el texto ingresado
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
