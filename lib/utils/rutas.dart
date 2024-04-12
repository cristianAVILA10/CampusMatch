import 'package:campusmatch/screens/Login.dart';
import 'package:campusmatch/screens/Paso1Cuenta.dart';
import 'package:campusmatch/screens/Resgistrame.dart';
import 'package:campusmatch/screens/screens.dart';
import 'package:flutter/material.dart';

final regisrarme = "/regis";

Map<String, Widget Function(BuildContext)> rutas = {
  '/': (context) => Inicio(),
  regisrarme: (context) => Registrame(),
  '/login': (context) => Login(),
  '/paso1cuenta': (context) => Paso1Cuenta(),
};
