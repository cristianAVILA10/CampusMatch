import 'package:flutter/material.dart';
import 'package:campusmatch/screens/Paso3Cuenta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FormPaso3Cuenta extends StatelessWidget {
  const FormPaso3Cuenta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Añadir gustos de interés',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(
            'Selecciona máximo 6 intereses',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          Expanded(
            child: ListCardsScreen(),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 3),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Text(
                      'OMITIR',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  width: 160,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Paso3Cuenta()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Colors.black, width: 3),
                      ),
                      backgroundColor: Colors.black,
                    ),
                    child: Text(
                      'SIGUIENTE',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
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

class ListCardsScreen extends StatefulWidget {
  const ListCardsScreen({Key? key}) : super(key: key);

  @override
  _ListCardsScreenState createState() => _ListCardsScreenState();
}

class _ListCardsScreenState extends State<ListCardsScreen> {
  @override
  List<String> image = [
    'socks',
    'socks',
    'socks',
    'socks',
    'socks',
  ];

  List<String> title = ['Futbol', 'Peliculas', 'Comida', 'Salidas', 'Carros'];
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: image.length,
        itemBuilder: (BuildContext context, int index) {
          return card(image[index], title[index], context);
        },
      ),
    );
  }
}

Widget card(String image, String title, BuildContext context) {
  return Card(
    color: const Color.fromARGB(255, 255, 255, 255),
    borderOnForeground: true,
    elevation: 2.0,
    margin: const EdgeInsets.only(top: 15.0),
    child: Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  FontAwesomeIcons.image,
                  size: 35,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.yellow, width: 3),
                    ),
                    backgroundColor: Colors.yellow,
                  ),
                  child: const Icon(Icons.add)),
            ],
          ),
        ],
      ),
    ),
  );
}
