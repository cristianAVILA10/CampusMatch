import 'package:campusmatch/widgets/PrincipalHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campusmatch/widgets/CardList.dart';

class Paso3Cuenta extends StatelessWidget {
  const Paso3Cuenta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          PrincipalHeader(
            fontSize: 50,
            iconsSize: 35,
            textColor: Colors.black,
          ),
          Expanded(
            child: FormPaso3Cuenta(),
          ),
        ],
      ),
    );
  }
}
