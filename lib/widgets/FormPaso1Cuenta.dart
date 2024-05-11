import 'dart:math';

import 'package:campusmatch/Models/User.dart';
import 'package:campusmatch/widgets/FormInput.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:campusmatch/screens/Paso2Cuenta.dart';
import 'package:campusmatch/utils/rutas.dart' as routes;

class FormPaso1Cuenta extends StatefulWidget {
  const FormPaso1Cuenta({Key? key}) : super(key: key);

  @override
  _FormPaso1CuentaState createState() => _FormPaso1CuentaState();
}

class _FormPaso1CuentaState extends State<FormPaso1Cuenta> {
  TextEditingController _despontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    String imageUrl = UsuarioActual.instancia.usuario.getImagen ?? '';
print('imagen');
print(imageUrl);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Subir foto de perfil',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10),
          ImageInputCircle(
            radius: 70,
            imageUrl: imageUrl,
            onTap: () {
              print('tap');
              print(UsuarioActual.instancia.usuario.getImagen);
              Navigator.pushNamed(context, routes.cargaImage);
            },
          ),
          SizedBox(height: 10),
          Text(
            'Nombre Usuario',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 20),
          Text(
            'Añade una descripción',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10),
          FormInput(
              controller: _despontroller,
              hintText: 'Descripción',
              keyboardType: TextInputType.text,
              obscureText: false,
              width: 0.8,
              height: 0.2),
          SizedBox(height: 20),
          Container(
            height: Size.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 3),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'OMITIR',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Paso2Cuenta()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 3),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'SIGUIENTE',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class ImageInputCircle extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final VoidCallback onTap;

  const ImageInputCircle({
    Key? key,
    this.imageUrl,
    required this.radius,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        radius: radius,
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        child: imageUrl == null ? Icon(Icons.add_a_photo, size: radius * 0.5) : null,
      ),
    );
  }
}