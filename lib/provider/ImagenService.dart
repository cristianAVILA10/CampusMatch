import 'package:campusmatch/Models/User.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:campusmatch/provider/UserService.dart';
import 'package:campusmatch/screens/Paso1Cuenta.dart';

class  ImagenService{

  Future<String> uploadImage(File imageFile, int id) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.1.12:8080/api-user/upload'),
    );
    
    // Agregar el archivo al cuerpo de la solicitud
    var multipartFile = await http.MultipartFile.fromPath('archivo', imageFile.path);
    request.files.add(multipartFile);
    request.fields['id'] = id.toString();
    
    // Enviar la solicitud y esperar la respuesta
    var response = await request.send();

    // Leer la respuesta
    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, leer el cuerpo de la respuesta como cadena y devolverlo
    //  UsuarioActual.instancia.usuario = UsuarioActual.instancia.usuario.(imagen: imageUrl);
    print('logger 1');
    print(response.stream.bytesToString());
    UserService.obtenerUserbyId(UsuarioActual.instancia.usuario.getId);
      return await response.stream.bytesToString();
    } else {
      // Si la respuesta no es exitosa, devolver un mensaje de error
      return "Error al cargar la imagen";
    }

    
  }
}