import 'package:campusmatch/widgets/FormPaso1Cuenta.dart';
import 'package:flutter/material.dart';
import 'package:campusmatch/screens/Paso3Cuenta.dart';
import 'package:image_input/image_input.dart';
import 'package:campusmatch/utils/rutas.dart' as routes;

class FormPaso2Cuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Text(
          'Añadir fotos de presentación',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: ImageInputCircle(
                radius: 45,
                imageUrl: null,
                onTap: () {
                  print('tap');
                  Navigator.pushNamed(context, routes.cargaImage,
                      arguments: {'numImagen': '1'});
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ImageInputCircle(
                radius: 45,
                imageUrl: null,
                onTap: () {
                  print('tap');
                  Navigator.pushNamed(context, routes.cargaImage,
                      arguments: {'numImagen': '2'});
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: ImageInputCircle(
                radius: 45,
                imageUrl: null,
                onTap: () {
                  print('tap');
                  Navigator.pushNamed(context, routes.cargaImage,
                      arguments: {'numImagen': '3'});
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ImageInputCircle(
                radius: 45,
                imageUrl: null,
                onTap: () {
                  print('tap');
                  Navigator.pushNamed(context, routes.cargaImage,
                      arguments: {'numImagen': '4'});
                },
              ),
            ),
          ],
        ),
        SizedBox(
          //color: Colors.green,
          height: Size.height * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
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
              SizedBox(
                width: 160,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Paso3Cuenta()));
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
    );
  }
}
