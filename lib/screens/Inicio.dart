import 'package:campusmatch/screens/Resgistrame.dart';
import 'package:campusmatch/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              //color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("C", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold ),),
                  Icon(FontAwesomeIcons.book, size: 35,),
                  Text("mpusM", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold ),),
                  Icon(FontAwesomeIcons.solidHeart, size: 35,),
                  Text("tch", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold ),),
                ],
              ),
            ),
          ),
          Container(
            //color: Colors.green,
            height: Size.height * 0.2,       
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Container(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                     onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 3),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Text('INGRESA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                  ),
                ),
                Container(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Registrame()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 3),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    child: Text('REGISTRARME', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


