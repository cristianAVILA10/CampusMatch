import 'package:campusmatch/widgets/FormRecuperacion.dart';
import 'package:campusmatch/widgets/PrincipalHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Recuperacion extends StatelessWidget {
  const Recuperacion({super.key});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Expanded(
            PrincipalHeader(fontSize: 50, iconsSize: 35, textColor: Colors.black,),
            FormRecuperacion(),
          ],
              ),
      ),
          );
  }
}
