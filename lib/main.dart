import 'package:campusmatch/screens/Inicio.dart';
import 'package:campusmatch/screens/Resgistrame.dart';
import 'package:flutter/material.dart';
import 'package:campusmatch/screens/screens.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context)=> Inicio(),
        '/registrar' : (context) => Registrame()
      },
      theme: ThemeData.light().copyWith(
       // appBarTheme:  AppBarTheme(color: Colors.blueAccent)
      ),
    );
  }
}