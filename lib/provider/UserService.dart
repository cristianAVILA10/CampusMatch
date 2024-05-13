//servicios de  usuarios
import 'dart:convert';
import 'dart:math';

import 'package:campusmatch/main.dart';
import 'package:campusmatch/screens/Paso1Cuenta.dart';
import 'package:campusmatch/widgets/MensajeWarning.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:campusmatch/utils/rutas.dart' as routes;

import 'package:campusmatch/Models/User.dart';

class UserService {
  static Future<User> obtenerUser(String email, String password) async {
    final url = Uri.parse('http://${hostGlobal}:8080/api-user/users');

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

  static Future<User> obtenerUserbyId(int id) async {
    final url =
        Uri.parse('http://${hostGlobal}:8080/api-user/userbyid?id=${id}');

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
  static Future<User> crearUser(String usuario, String email, String password,
      BuildContext context) async {
    final url = Uri.parse('http://${hostGlobal}:8080/api-user/setuser');
    Random random = Random();
    // Crear un mapa con los datos del usuario
    final Map<String, String> datosUsuario = {
      'usuario': usuario,
      'email': email,
      'password': password,
      'nombre': usuario,
      'imageAsset': "http://${hostGlobal}:8080/api-user/getimg/${email}_1.jpg",
      'distance': "${random.nextInt(10) + 1} kilometros",
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

      if (respuesta.statusCode < 300 || respuesta.statusCode >= 200) {
        print("Solicitud correcta");

        final datosJson = jsonDecode(respuesta.body);
        final nuevoUsuario = User.fromJson(datosJson);

        // Configurar el usuario actual en UsuarioActual
        UsuarioActual.instancia.usuario = nuevoUsuario;

        return nuevoUsuario;
      } else {
        MensajeWarning(
            context, 'Error', respuesta.statusCode.toString(), 'Aceptar');
        throw Exception('Error al crear el usuario: ${respuesta.statusCode}');
      }
    } catch (e) {
      MensajeWarning(context, 'Error', e.toString(), 'Aceptar');
      throw Exception('Error al crear el usuario: $e');
    }
  }

  static Future<User> setDescripcion(int id, String descripcion) async {
    final url = Uri.parse('http://${hostGlobal}:8080/api-user/$id/descripcion');
    print(url);
    // Crear un usuario con solo la nueva descripción
    final Map<String, dynamic> datosUsuario = {
      'descripcion': descripcion,
    };

    try {
      final respuesta = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(datosUsuario),
      );

      if (respuesta.statusCode < 300 || respuesta.statusCode >= 200) {
        // Si la solicitud es exitosa, devuelve el usuario actualizado
        final datosJson = jsonDecode(respuesta.body);
        final nuevoUsuario = User.fromJson(datosJson);
          print('pasa 1.1');
        return nuevoUsuario;
      } else {
        // Manejo de errores
        throw Exception(
            'Error al actualizar la descripción del usuario: ${respuesta.statusCode}');
      }
    } catch (e) {
      // Manejo de excepciones
      throw Exception('Error al conectar con el servidor: $e');
    }
  }

  static Future<User> loginIn(
      String email, String password, BuildContext context) async {
    final url = Uri.parse('http://${hostGlobal}:8080/api-user/login');

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

      if (respuesta.statusCode < 300 || respuesta.statusCode >= 200) {
        print("Solicitud correcta");

        final datosJson = jsonDecode(respuesta.body);
        Navigator.pushNamed(context, routes.homePage);
        return User.fromJson(datosJson);
      } else {
        MensajeWarning(
            context, 'Error', respuesta.statusCode.toString(), 'Aceptar');
        throw Exception('Error al crear el usuario: ${respuesta.statusCode}');
      }
    } catch (e) {
      MensajeWarning(context, 'Error', e.toString(), 'Aceptar');
      throw Exception('Error al crear el usuario: $e');
    }
  }

  void setUsuario(String usuario, String email, String contrasena,
      BuildContext context) async {
    try {
      final user =
          await UserService.crearUser(usuario, email, contrasena, context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Paso1Cuenta()));
      print('User obtenido: ${user.nombre}');
    } catch (error) {
      print('Error: $error');
    }
  }

  void actDescripcion(String descripcion, BuildContext context) async {
    print( 'descripcion: $descripcion id: ${UsuarioActual.instancia.usuario.getId}');
    try {
       print('pasa 1');
      final user = await UserService.setDescripcion(UsuarioActual.instancia.usuario.getId, descripcion);
        print('pasa 2');
      Navigator.pushNamed(context, routes.paso2Cuenta);
      print('User obtenido: ${user.nombre}');
    } catch (error) {
      print('Error 1: $error');
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
