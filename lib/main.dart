import 'package:flutter/material.dart';
import 'package:campusmatch/utils/rutas.dart' as routes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: routes.rutas,
      theme: ThemeData.light().copyWith(
          // appBarTheme:  AppBarTheme(color: Colors.blueAccent)
          ),
    );
  }
}
