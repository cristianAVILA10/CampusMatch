import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campusmatch/screens/HomePage.dart';

class BotoneraPerfilPage extends StatefulWidget {
  const BotoneraPerfilPage({Key? key}) : super(key: key);

  @override
  State<BotoneraPerfilPage> createState() => _BotoneraPerfilPageState();
}

class _BotoneraPerfilPageState extends State<BotoneraPerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide( 
            color: Colors.grey,
            width: 2.0, 
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(FontAwesomeIcons.comment, size: 25,color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(FontAwesomeIcons.magnifyingGlass, size: 25,color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
            },
            icon: Icon(FontAwesomeIcons.heart, size: 25,color: Colors.grey),
          ),
          IconButton(
            onPressed: () {
              
            },
            icon: Icon(FontAwesomeIcons.circleUser, size: 25),
          ),
        ],
      ),
    );
  }
}
