import 'package:flutter/material.dart';



class GoogleMapsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Este es el Mapa'),
      ),
      body: Center(
        child: Text('Aquí irá el mapa.'),
      ),
    );
  }
}