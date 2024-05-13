import 'dart:convert';

import 'package:campusmatch/Models/Interes.dart';
import 'package:campusmatch/Models/User.dart';
import 'package:campusmatch/main.dart';
import 'package:http/http.dart' as http;

class InteresService {
  // URL de tu API o base de datos donde se encuentran los datos de los intereses
  final String apiUrl = 'http://${hostGlobal}:8080/api/intereses';

  // Método para obtener los intereses desde la API o base de datos
  Future<List<Interes>> obtenerIntereses() async {
    try {
      // Realiza una petición GET a la URL de la API
      var response = await http.get(Uri.parse(apiUrl));

      // Verifica si la petición fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        // Decodifica la respuesta JSON en una lista de objetos Interes
       List<dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
        List<Interes> intereses =
            data.map((interest) => Interes.fromJson(interest)).toList();
        return intereses; // Retorna la lista de intereses
      } else {
        throw Exception('Error al obtener los intereses: Código de estado ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error al obtener los intereses: $error');
    }
  }

   Future<void> insertarInteres(int idInteres) async {
    try {
      // Define la URL de tu API donde realizarás la inserción del interés
      String url = 'http://192.168.1.12:8080/api/intereses/agregar';

      // Crea un mapa con los datos del interés a insertar
      Map<String, dynamic> data = {
        'idInteres': idInteres,
        "idUsuario": UsuarioActual.instancia.usuario.getId
      };

      // Convierte el mapa de datos a JSON
      String body = json.encode(data);

      // Realiza la solicitud POST a la API para insertar el interés
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );

      // Verifica si la solicitud fue exitosa (código de estado 200)
      if (response.statusCode == 200) {
        // Si la inserción fue exitosa, no necesitas hacer nada más aquí
        // Puedes agregar algún código adicional si lo necesitas
      } else {
        // Si la solicitud no fue exitosa, puedes manejar el error de alguna manera
        // Por ejemplo, puedes imprimir el cuerpo de la respuesta para depurar
        print('Error al insertar el interés: ${response.body}');
        // Puedes lanzar una excepción si lo prefieres
        throw Exception('Error al insertar el interés');
      }
    } catch (e) {
      // Maneja cualquier excepción que pueda ocurrir durante la solicitud
      print('Excepción al insertar el interés: $e');
      // Lanza la excepción para que quien llame a este método pueda manejarla
 
    }
  }
}