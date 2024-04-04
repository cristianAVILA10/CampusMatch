import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campusmatch/widgets/ContenidoPerfil.dart';
import 'package:campusmatch/widgets/BotoneraPerfilPage.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Acción para la rueda de opciones
            },
            icon: Icon(FontAwesomeIcons.gear, size: 30,),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ContenidoPerfil(),
          ),
          BotoneraPerfilPage(),
        ],
      ),
    );
  }
}
