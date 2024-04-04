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
          SizedBox(
            width: double.infinity,
            height: size.height * 0.15,
            //color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "C",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Icon(
                  FontAwesomeIcons.book,
                  size: 35,
                ),
                Text(
                  "mpusM",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 35,
                ),
                Text(
                  "tch",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: FormPaso3Cuenta(),
          ),
        ],
      ),
    );
  }
}