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
      String url = 'http://${hostGlobal}:8080/api/intereses/agregar';

      Map<String, dynamic> data = {
        'idInteres': idInteres,
        "idUsuario": UsuarioActual.instancia.usuario.getId
      };

      String body = json.encode(data);

      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body,
      );


      if (response.statusCode == 200) {
        print('perfecto');
      } else {
        print('Error al insertar el interés: ${response.body}');
        throw Exception('Error al insertar el interés');
      }
    } catch (e) {
      print('Excepción al insertar el interés: $e');

 
    }
  }
}