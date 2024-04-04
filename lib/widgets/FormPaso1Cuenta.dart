import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:campusmatch/screens/Paso2Cuenta.dart';

class FormPaso1Cuenta extends StatelessWidget {
  const FormPaso1Cuenta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Subir foto de perfil',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10),
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 70,
            // Aquí puedes poner la imagen del perfil
          ),
          SizedBox(height: 10),
          Text(
            'Nombre Usuario',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 20),
          Text(
            'Añade una descripción',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 10),
          _InputDescripcion(Size),
          SizedBox(height: 20),
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
                              builder: (context) => Paso2Cuenta()));
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

  Container _InputDescripcion(Size Size) {
    return Container(
      width: Size.width * 0.8,
      height: Size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Descripción",
        ),
      ),
    );
  }
}
