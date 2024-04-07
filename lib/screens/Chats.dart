import 'package:campusmatch/screens/ChatsInteresados.dart';
import 'package:campusmatch/widgets/BotoneraHomePage.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'James',
      'message': 'Thank you! That was very helpful!',
      'image': 'lib/assets/images/img3.png'
    },
    {
      'name': 'Will Kenny',
      'message': 'I know... I\'m trying to get the funds.',
      'image': 'lib/assets/images/img6.png'
    },
    // Añade más chats aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return GestureDetector( // Agrega GestureDetector alrededor de ListTile
            onTap: () {
              // Navegación al pulsar en el chat
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatsInteresados(), // Reemplaza OtraVista con la vista a la que quieres dirigir
                ),
              );
            },
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(chats[index]['image']),
                  ),
                  title: Text(
                    chats[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(chats[index]['message']),
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Define la vista a la que se dirigirá al hacer clic
class OtraVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otra Vista'),
      ),
      body: Center(
        child: Text('Esta es otra vista'),
      ),
    );
  }
}