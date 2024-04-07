import 'package:campusmatch/widgets/BotoneraHomePage.dart';
import 'package:flutter/material.dart';


class PersonasInteresadas extends StatelessWidget {
  // La clase ProfileList se mantiene igual que antes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intereses'),
      ),
      body:  ProfileList(),
      bottomNavigationBar: BotoneraHomePage(), 
      
    );
  }
}

class ProfileList extends StatelessWidget {
  final List<Map<String, dynamic>> profiles = [
    {'name': 'Carlos', 'image': 'lib/assets/images/carlos.png'},
    {'name': 'Eduardo', 'image': 'lib/assets/images/img1.png'},
    {'name': 'Felipe', 'image': 'lib/assets/images/img2.png'},
    {'name': 'Andres', 'image': 'lib/assets/images/img3.png'},
    {'name': 'Mauricio', 'image': 'lib/assets/images/img4.png'},
    {'name': 'Santiago', 'image': 'lib/assets/images/img5.png'},
    {'name': 'Pedro', 'image': 'lib/assets/images/img6.png'},
    // Añade más perfiles aquí
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 columnas por fila
      ),
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10.0), // Margen entre las imágenes
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profiles[index]['image']),
                radius: 50, // Tamaño del círculo
              ),
              SizedBox(height: 5), // Espacio entre la imagen y el nombre
              Text(
                profiles[index]['name'],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8),
              ),
             
            ],
          ),
        );
      },
    );
  }
}
