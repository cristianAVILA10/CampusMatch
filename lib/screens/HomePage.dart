import 'package:flutter/material.dart';
import 'package:campusmatch/widgets/CardHomePage.dart';
import 'package:campusmatch/widgets/BotoneraHomePage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: Size.height * 0.15, 
            //color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("C", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.grey ),),
                Icon(FontAwesomeIcons.book, size: 25,color: Colors.grey),
                Text("mpusM", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.grey  ),),
                Icon(FontAwesomeIcons.solidHeart, size: 25,color: Colors.grey),
                Text("tch", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Colors.grey ),),
              ],
            ),
          ),
          CardHomePage(),
          BotoneraHomePage(),
        ],
      ),
    );
  }
}
