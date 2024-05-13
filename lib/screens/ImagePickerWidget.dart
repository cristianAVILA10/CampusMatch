import 'dart:io';

import 'package:campusmatch/Models/User.dart';
import 'package:campusmatch/provider/ImagenService.dart';
import 'package:campusmatch/provider/UserService.dart';
import 'package:campusmatch/screens/Paso1Cuenta.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:campusmatch/utils/rutas.dart' as routes;


class ImagePickerWidget extends StatefulWidget {
 final String numImagen; // Parámetro adicional
 const ImagePickerWidget({Key? key, required this.numImagen}) : super(key: key);
  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();

}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        print('entra state');
        print(UsuarioActual.instancia.usuario.getId);
        print(widget.numImagen);
        _imageFile = File(pickedFile.path);
        var imagenService = ImagenService();

        print('entra state 2: ');
        imagenService.uploadImage(_imageFile!,UsuarioActual.instancia.usuario.getId, widget.numImagen);
        

        if (widget.numImagen == "fotoperfil"){
             Navigator.pushNamed(context, routes.paso1Cuenta);
        }else{
          Navigator.pushNamed(context, routes.paso2Cuenta);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile != null
                ? Image.file(_imageFile!)
                : Icon(Icons.image, size: 100.0),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery,context),
              child: Text('Seleccionar de la Galería'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera,context),
              child: Text('Tomar una Foto'),
            ),
          ],
        ),
      ),
    );
  }
}

