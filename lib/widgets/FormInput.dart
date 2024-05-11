import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText ;
  final double?  width;  
  final double?  height; 
  const FormInput({super.key, required this.controller, 
                   required this.hintText, required this.keyboardType, 
                   required this.obscureText,  this.width = 0.9, this.height =  0.06});
  @override
  Widget build(BuildContext context) {

     final Size = MediaQuery.of(context).size;
    // TODO: implement build
    return Container(
      width: Size.width * width!,
      height: Size.height * height!,
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
