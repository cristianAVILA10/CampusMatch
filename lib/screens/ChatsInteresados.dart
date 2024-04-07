import 'package:flutter/material.dart';

class ChatsInteresados extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      'sender': 'James',
      'text': 'Really love your most recent photo...',
      'isUser': false,
      'image': 'lib/assets/images/img5.png',
    },
    {
      'sender': 'User',
      'text': 'A fast 50mm like f1.8 would help with the bokeh...',
      'isUser': true,
      'image': 'lib/assets/images/img4.png', // Reemplaza 'user.png' con la imagen del usuario
    },
    // Añade más mensajes aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with James'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['isUser'];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: isUser
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!isUser) ...[
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(message['image']),
                        ),
                        SizedBox(width: 10),
                      ],
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: isUser ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(isUser ? 20 : 0),
                              topRight: Radius.circular(isUser ? 0 : 20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            message['text'],
                            style: TextStyle(
                              color: isUser ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      if (isUser) ...[
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(message['image']),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
          _buildInputBar(), // Botonera para escribir mensajes
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: 'message...',
              ),
            ),
          ),
          //SizedBox(width: 2),
          IconButton(
            onPressed: () {
              // Acción para el botón de enviar mensaje
            },
            icon: Icon(Icons.send),
            color: Colors.blue,
          ),
          //SizedBox(width: 2),
          IconButton(
            onPressed: () {
              // Acción para el botón de emoticones
            },
            icon: Icon(Icons.emoji_emotions),
            color: Colors.grey,
            
          ),
        //  SizedBox(width: 2),
          IconButton(
            onPressed: () {
              // Acción para el botón de audio
            },
            icon: Icon(Icons.mic),
            color: Colors.grey,
          ),

          IconButton(
            onPressed: () {
              // Acción para el botón de añadir imágenes
            },
            icon: Icon(Icons.image),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}