import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_input/image_input.dart';

class ContenidoPerfil extends StatelessWidget {
  const ContenidoPerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Columna para el círculo y el texto "Subir foto de perfil"
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 70,
                  backgroundImage: AssetImage('lib/assets/images/img3.png')
                ),
                SizedBox(height: 10),
                Text(
                  'Actualizar perfil',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(13, 153, 255, 100)),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Columna para los textos "Nombre", "Correo", "Intereses" y "Descripción"
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildTextRow('Nombre del\nusuario', 'Helena Hils'),
                  _buildTextRow('Email', 'HelenaHils@dominio.com'),
                  _buildTextRow(
                      'Intereses', 'Interés 1\nInterés 2\nInterés 3\nañadir +'),
                  _buildTextRow('Descripción',
                      ' individuo apasionado por la tecnología y el conocimiento. Tengo una mente inquisitiva y siempre estoy buscando aprender cosas nuevas y entender cómo funcionan las cosas. Me encanta explorar diferentes temas, desde la inteligencia artificial hasta la filosofía, y disfruto debatir y compartir ideas con otros.'),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ImageInput(
                          allowEdit: true,
                          allowMaxImage: 1,
                          addImageIcon: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.add, color: Color(0xFFCECECE)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: ImageInput(
                          allowEdit: true,
                          allowMaxImage: 1,
                          addImageIcon: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.add, color: Color(0xFFCECECE)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir una fila de texto con un título y un contenido
  Widget _buildTextRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Text(
            '$title:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          // Contenido
          Expanded(
            child: Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}


