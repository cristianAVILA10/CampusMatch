import 'package:campusmatch/screens/GoogleMapsView.dart';
import 'package:campusmatch/screens/HomePage.dart';
import 'package:campusmatch/screens/Paso3Cuenta.dart';
import 'package:campusmatch/screens/PersonasInteresadas.dart';
import 'package:campusmatch/screens/Chats.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campusmatch/screens/PerfilPage.dart';

class BotoneraHomePage extends StatefulWidget {
  const BotoneraHomePage({Key? key}) : super(key: key);

  @override
  State<BotoneraHomePage> createState() => _BotoneraHomePageState();
}

class _BotoneraHomePageState extends State<BotoneraHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide( 
            color: Colors.grey,
            width: 2.0, 
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Chats()));
              // Acción para el primer botón
            },
            icon: Icon(FontAwesomeIcons.comment, size: 25,color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              // Acción para el segundo botón
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
            },
            icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 25),
          ),
          IconButton(
            onPressed: () {
              // Acción para el tercer botón
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PersonasInteresadas()));
            },
            icon: Icon(FontAwesomeIcons.heart, size: 25,color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PerfilPage()));
            },
            icon: Icon(FontAwesomeIcons.circleUser, size: 25,color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> GoogleMapsView()));
            },
            icon: Icon(FontAwesomeIcons.mapLocation, size: 25,color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
