import 'package:campusmatch/widgets/PrincipalHeader.dart';
import 'package:flutter/material.dart';
import 'package:campusmatch/widgets/CardHomePage.dart';
import 'package:campusmatch/widgets/BotoneraHomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PrincipalHeader(fontSize: 40, iconsSize: 25, textColor: Colors.grey, fontWeight: FontWeight.bold),
          CardHomePage(),
          BotoneraHomePage(),
        ],
      ),
    );
  }
}
