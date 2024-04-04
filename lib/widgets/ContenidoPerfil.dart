import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                  // Aquí puedes poner la imagen del perfil
                ),
                SizedBox(height: 10),
                Text(
                  'Subir foto de perfil',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Columna para los textos "Nombre", "Correo", "Intereses" y "Descripción"
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextRow('Nombre', 'Nombre de usuario'),
                _buildTextRow('Correo', 'correo@dominio.com'),
                _buildTextRow('Intereses', 'Interés 1, Interés 2, Interés 3'),
                _buildTextRow('Descripción', 'Añade una descripción aquí'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir una fila de texto con un título y un contenido
  Widget _buildTextRow(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
