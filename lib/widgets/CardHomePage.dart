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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'lib/assets/images/img1.png'), // Reemplaza 'assets/imagen_fondo.jpg' con la ruta de tu imagen
          fit: BoxFit.cover,
        ),
      ),
    ),
    Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'lib/assets/images/img2.png'), // Reemplaza 'assets/imagen_fondo.jpg' con la ruta de tu imagen
          fit: BoxFit.cover,
        ),
      ),
    ),
    Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'lib/assets/images/img3.png'), // Reemplaza 'assets/imagen_fondo.jpg' con la ruta de tu imagen
          fit: BoxFit.cover,
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Expanded(
      child: CardSwiper(
        cardsCount: cards.length,
        cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
            cards[index],
      ),
    );
  }
}
