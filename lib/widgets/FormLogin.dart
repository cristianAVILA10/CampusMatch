import 'package:campusmatch/Models/User.dart';
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
                handleSubmit(email, contrasena, context);
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

void handleSubmit(String email, String contrasena, BuildContext context) {
  // Esta función manejará la lógica para procesar el correo electrónico ingresado
  print("Correo electrónico ingresado: $email");
  print("contrasena ingresado: $contrasena");
  getOnDisplayNowPlayingMovie();
  if(contrasena == '123'){
    print("pasaaaaaa");
    Navigator.pushNamed(context, routes.homePage);
  }else{
    MensajeWarning(context, 'Sin Acceso', 'Correo o contraseña invalida', 'Aceptar');
    print("no pasaaaa");
  }

}


class UserService {
  static Future<User> obtenerUser(String email, String password) async {
    final url = Uri.parse('http://192.168.239.1:8080/api-user/users');

    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      // Si la solicitud es exitosa, parseamos los datos JSON
      final datosJson = jsonDecode(respuesta.body);
      return User.fromJson(datosJson);
    } else {
      // Si la solicitud falla, lanzamos una excepción o devolvemos null, dependiendo de tu lógica de manejo de errores
      throw Exception('Error al obtener el User: ${respuesta.statusCode}');
    }
  }
}

void getOnDisplayNowPlayingMovie() async {
  try {
    final User = await UserService.obtenerUser('holka', 'fdfd');
    print('User obtenido: ${User.nombre}');
  } catch (error) {
    print('Error: $error');
  }
}



