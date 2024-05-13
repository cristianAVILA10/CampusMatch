import 'package:campusmatch/screens/HomePage.dart';
import 'package:campusmatch/screens/ImagePickerWidget.dart';
import 'package:campusmatch/screens/Login.dart';
import 'package:campusmatch/screens/Paso1Cuenta.dart';
import 'package:campusmatch/screens/Paso2Cuenta.dart';
import 'package:campusmatch/screens/Paso3Cuenta.dart';
import 'package:campusmatch/screens/Resgistrame.dart';
import 'package:campusmatch/screens/screens.dart';

import 'package:campusmatch/widgets/SignInDemo.dart';
import 'package:flutter/material.dart';

final regisrarme = "/regis";
final login = "/login";
final homePage = "/homepage";
final signGoogle = "/signgoogle";
const cargaImage = "/cargaimage";
const paso1Cuenta = "/paso1cuenta";
const paso2Cuenta = "/paso2cuenta";
const paso3Cuenta = "/paso3cuenta";

Map<String, Widget Function(BuildContext)> rutas = {
  '/': (context) => Inicio(),
  regisrarme: (context) => Registrame(),
  login: (context) => Login(),
  homePage: (context) => HomePage(),
  paso1Cuenta: (context) => Paso1Cuenta(),
 // signGoogle: (context) => Paso1Cuenta(),
  cargaImage: (context) {
  final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
  final numImagen = args['numImagen'] as String;
  return ImagePickerWidget(numImagen: numImagen);
},
  paso2Cuenta: (context) => Paso2Cuenta(),
  paso3Cuenta: (context) => Paso3Cuenta()
};
