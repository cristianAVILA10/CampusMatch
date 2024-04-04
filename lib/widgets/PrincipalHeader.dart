import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PrincipalHeader extends StatelessWidget {

  final double fontSize;
  final double iconsSize;
  final Color textColor;

  const PrincipalHeader({required this.fontSize, required this.iconsSize, required this.textColor});
  
  @override
  Widget build(BuildContext context) {
     final Size = MediaQuery.of(context).size;
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      height: Size.height * 0.15,
      //color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("C",style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: textColor),
          ),
          Icon( FontAwesomeIcons.book,size: iconsSize, color:textColor ,
          ),
          Text( "mpusM", style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: textColor),
          ),
          Icon(FontAwesomeIcons.solidHeart,size: iconsSize,color:textColor 
          ),
          Text("tch",style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: textColor),
          ),
        ],
      ),
    );
  }
}


