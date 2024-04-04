import 'package:campusmatch/widgets/FormPaso1Cuenta.dart';
import 'package:campusmatch/widgets/PrincipalHeader.dart';
import 'package:flutter/material.dart';

class Paso1Cuenta extends StatelessWidget {
  const Paso1Cuenta({super.key});

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
            PrincipalHeader(fontSize: 50,iconsSize: 35 , textColor:  Colors.black ),
            FormPaso1Cuenta(),
          ],
              ),
      ),
          );
  }
}
