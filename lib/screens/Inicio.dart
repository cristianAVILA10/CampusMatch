import 'package:campusmatch/screens/Resgistrame.dart';
import 'package:campusmatch/screens/Login.dart';
import 'package:campusmatch/widgets/PrincipalHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campusmatch/utils/rutas.dart' as routes;

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PrincipalHeader(
              fontSize: 50,
              iconsSize: 35,
              textColor: Colors.black,
            ),
          ),
          Container(
            //color: Colors.green,
            height: Size.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 3),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'INGRESA',
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
                      Navigator.pushNamed(context, routes.regisrarme);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 3),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'REGISTRARME',
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
