import 'package:campusmatch/widgets/PrincipalHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campusmatch/widgets/FormPaso2Cuenta.dart';

class Paso2Cuenta extends StatelessWidget {
  const Paso2Cuenta({super.key});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrincipalHeader(
              fontSize: 50,
              iconsSize: 35,
              textColor: Colors.black,
            ),
            FormPaso2Cuenta(),
          ],
        ),
      ),
    );
  }
}
