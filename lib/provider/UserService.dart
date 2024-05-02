//servicios de  usuarios
import 'dart:convert';

import 'package:campusmatch/widgets/MensajeWarning.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:campusmatch/utils/rutas.dart' as routes;

import 'package:campusmatch/Models/User.dart';

class UserService {
  static Future<User> obtenerUser(String email, String password) async {
    final url = Uri.parse('http://192.168.1.12:8080/api-user/users');

    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      print("Solicitud correcta");
      // Si la solicitud es exitosa, parseamos los datos JSON
      final datosJson = jsonDecode(respuesta.body);
      if (datosJson is List && datosJson.isNotEmpty) {
        // Si recibimos una lista de usuarios, tomamos el primero
        return User.fromJson(datosJson[0]);
      } else {
        throw Exception('No se encontró un usuario');
      }
    } else {
      // Si la solicitud falla, lanzamos una excepción o devolvemos null, dependiendo de tu lógica de manejo de errores
      throw Exception('Error al obtener el User: ${respuesta.statusCode}');
    }
  }

  //CREA USUARIO
  static Future<User> crearUser(String usuario, String email, String password, BuildContext context) async {
    final url = Uri.parse('http://192.168.1.12:8080/api-user/setuser');

    // Crear un mapa con los datos del usuario
    final Map<String, String> datosUsuario = {
      'usuario': usuario,
      'email': email,
      'password': password,
      'nombre': "nom2",
    };

    try {
      final respuesta = await http.post(
        url,
        headers: {
          'Content-Type':
              'application/json', // Especificar el tipo de contenido como JSON
        },
        body: jsonEncode(datosUsuario), // Convertir el mapa de datos a JSON
      );

      if (respuesta.statusCode < 300  || respuesta.statusCode >= 200) {
        print("Solicitud correcta");

        final datosJson = jsonDecode(respuesta.body);
        return User.fromJson(datosJson);
      } else {
        MensajeWarning(context, 'Error', respuesta.statusCode.toString(),'Aceptar');
        throw Exception('Error al crear el usuario: ${respuesta.statusCode}');
      }
    } catch (e) {
      MensajeWarning(context, 'Error',e.toString(),'Aceptar');
      throw Exception('Error al crear el usuario: $e');
    }
  }


  static Future<User> loginIn(String email, String password, BuildContext context) async {
    final url = Uri.parse('http://192.168.1.12:8080/api-user/login');

    // Crear un mapa con los datos del usuario
    final Map<String, String> datosUsuario = {
      'email': email,
      'password': password,
    };

    try {
      final respuesta = await http.post(
        url,
        headers: {
          'Content-Type':
              'application/json', // Especificar el tipo de contenido como JSON
        },
        body: jsonEncode(datosUsuario), // Convertir el mapa de datos a JSON
      );

      if (respuesta.statusCode < 300  || respuesta.statusCode >= 200) {
        print("Solicitud correcta");

        final datosJson = jsonDecode(respuesta.body);
        Navigator.pushNamed(context, routes.homePage);
        return User.fromJson(datosJson);
      } else {
        MensajeWarning(context, 'Error', respuesta.statusCode.toString(),'Aceptar');
        throw Exception('Error al crear el usuario: ${respuesta.statusCode}');
      }
    } catch (e) {
      MensajeWarning(context, 'Error',e.toString(),'Aceptar');
      throw Exception('Error al crear el usuario: $e');
    }
  }

  void setUsuario(String usuario, String email, String contrasena, BuildContext context) async {
    try {
      final User = await UserService.crearUser(usuario, email, contrasena, context);
      print('User obtenido: ${User.nombre}');
    } catch (error) {
      print('Error: $error');
    }
  }

  void login(String email, String contrasena, BuildContext context) async {
    try {
      final User = await UserService.loginIn(email, contrasena, context);
      print('User obtenido: ${User.nombre}');
    } catch (error) {
      print('Error: $error');
    }
  }

}
