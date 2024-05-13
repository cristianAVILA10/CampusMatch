import 'package:campusmatch/Models/Interes.dart';
import 'package:campusmatch/provider/InteresService.dart';
import 'package:flutter/material.dart';
import 'package:campusmatch/screens/Paso3Cuenta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campusmatch/utils/rutas.dart' as routes;

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
                      Navigator.pushNamed(context, routes.homePage);
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
  @override
  _ListCardsScreenState createState() => _ListCardsScreenState();
}

class _ListCardsScreenState extends State<ListCardsScreen> {
  final InteresService interesService = InteresService();
  List<Interes> intereses = [];
  Set<int> interesesAgregados = {};

  @override
  void initState() {
    super.initState();
    obtenerIntereses();
  }

  Future<void> obtenerIntereses() async {
    List<Interes> listaIntereses = await interesService.obtenerIntereses();
    setState(() {
      intereses = listaIntereses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: intereses.length,
        itemBuilder: (BuildContext context, int index) {
          return card(intereses[index], context);
        },
      ),
    );
  }

  Widget card(Interes interes, BuildContext context) {
    bool agregado = interesesAgregados.contains(interes.id);
    Color colorBoton = agregado ? Colors.green : Colors.yellow;

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
                  interes.nombre,
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
                  onPressed: () {
                    setState(() {
                      if (!agregado) {
                        interesesAgregados.add(interes.id);
                      }
                    });
                    insertarInteres(interes.id);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.yellow, width: 3),
                    ),
                    backgroundColor: colorBoton,
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void insertarInteres(int idInteres) async {
    final interesService = InteresService();
    await interesService.insertarInteres(idInteres);
  }
}
