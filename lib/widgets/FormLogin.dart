import 'dart:developer';

import 'package:campusmatch/Models/User.dart';
import 'package:campusmatch/provider/UserService.dart';
import 'package:campusmatch/screens/HomePage.dart';
import 'package:campusmatch/screens/Recuperacion.dart';
import 'package:campusmatch/widgets/FormInput.dart';
import 'package:campusmatch/widgets/MensajeWarning.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:campusmatch/utils/rutas.dart' as routes;

import 'dart:convert';
import 'package:http/http.dart' as http;

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();

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
          FormInput(controller: _emailController, hintText: 'Correo@ominio.com', keyboardType: TextInputType.emailAddress, obscureText:false ),
          SizedBox(
            height: 15,
          ),
          FormInput(controller: _contrasenaController, hintText: 'contraseña', keyboardType: TextInputType.visiblePassword, obscureText:true ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: Size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Obtener el valor del campo de correo electrónico
                String email = _emailController.text;
                String contrasena = _contrasenaController.text;
                login(email, contrasena, context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.black, width: 3),
                ),
                backgroundColor: Colors.black,
              ),
              child: Text(
                'INICIAR SESION',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Recuperacion()));
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
              child: Text(
                '¿Has olvidado la contraseña?',
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

  @override
  void dispose() {
    // Limpiar el controlador al destruir el widget para evitar fugas de memoria
    _emailController.dispose();
    super.dispose();
  }
}

void login(String email, String contrasena, BuildContext context) {
  // Esta función manejará la lógica para procesar el correo electrónico ingresado
  print("Correo electrónico ingresado: $email");
  print("contrasena ingresado: $contrasena");
  var userService = UserService();
  userService.login(email, contrasena, context);
 
}


