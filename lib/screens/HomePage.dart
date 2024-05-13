import 'package:campusmatch/widgets/PrincipalHeader.dart';
import 'package:campusmatch/widgets/background_curve_widget.dart';
import 'package:campusmatch/widgets/cards_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:campusmatch/widgets/CardHomePage.dart';
import 'package:campusmatch/widgets/BotoneraHomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: const [
          // Otros widgets aquí
          PrincipalHeader(fontSize: 40, iconsSize: 25, textColor: Colors.grey, fontWeight: FontWeight.bold),
          CardsStackWidget(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BotoneraHomePage(),
          ),
        ],
      ),
    );
  }
}


