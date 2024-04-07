import 'package:campusmatch/screens/HomePage.dart';
import 'package:campusmatch/screens/Recuperacion.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.brown,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 15,
          ),
          _InputEmail(Size),
          SizedBox(
            height: 15,
                  ),
          _InputContrasena(Size),
          SizedBox(
            height: 15,
          ),
          Container(
            width: Size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              },
              style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black, width: 3),
              ),
              backgroundColor: Colors.black,
              ),
              child: Text('INICIAR SESION', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Recuperacion()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ), 
              child: 
                Text('¿Has olvidado la contraseña?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          ), 
        ],   
      ),
    );
  }

  Container _InputEmail(Size Size) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.symmetric(horizontal: Size.width * 0.05),
      margin: EdgeInsets.symmetric(horizontal: Size.width * 0.05),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Correo@dominio.com",
        ),
      ),
    );
  }

  Container _InputContrasena(Size Size) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.grey),
    ),
    padding: EdgeInsets.symmetric(horizontal: Size.width * 0.05),
    margin: EdgeInsets.symmetric(horizontal: Size.width * 0.05),
    child: TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 16),
      obscureText: true, // Oculta el texto ingresado
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Contraseña",
      ),
    ),
  );
}

}