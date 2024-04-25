import 'package:flutter/material.dart';

class MensajeWarning {

  final titulo;
  final mensaje;
  final textBoton;

  MensajeWarning(BuildContext context, this.titulo, this.mensaje, this.textBoton) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(
              mensaje),
          actions: [
            TextButton(
              onPressed: () {
                // Cerrar la ventana emergente
                Navigator.of(context).pop();
              },
              child: Text(textBoton),
            ),
          ],
        );
      },
    );
  }
}
