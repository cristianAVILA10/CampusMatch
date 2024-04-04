import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';

class CardHomePage extends StatefulWidget {
  const CardHomePage({super.key});

  @override
  State<CardHomePage> createState() => _CardHomePageState();
}

class _CardHomePageState extends State<CardHomePage> {

   final List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child: const Text("1", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
      color: const Color.fromARGB(255, 110, 161, 202),
    ),
    Container(
      alignment: Alignment.center,
      child: const Text("2", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
      color: const Color.fromARGB(255, 214, 124, 118),
    ),
    Container(
      alignment: Alignment.center,
      child: const Text("3", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
      color: const Color.fromARGB(255, 215, 132, 230),
    )
  ];
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Expanded(
            child: CardSwiper(
              cardsCount: cards.length,
              cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
            ),
    );
  }


}