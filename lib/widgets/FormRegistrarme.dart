import 'package:campusmatch/provider/UserService.dart';
import 'package:campusmatch/widgets/FormInput.dart';
import 'package:campusmatch/widgets/MensajeWarning.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:campusmatch/screens/Paso1Cuenta.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:campusmatch/utils/rutas.dart' as routes;

class FormRegistrarme extends StatefulWidget {
  const FormRegistrarme({super.key});

  @override
  State<FormRegistrarme> createState() => _FormRegistrarmeState();
}

class _FormRegistrarmeState extends State<FormRegistrarme> {
  TextEditingController _userontroller = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.brown,
      child: Column(
        children: [
          Container(
            //color: Colors.greenAccent,
            child: Text(
              'Cree una cuenta',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            //color: Colors.grey,
            child: Text(
              'Escriba su email para crear una',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          FormInput(
              controller: _userontroller,
              hintText: 'Nombre de usuario',
              keyboardType: TextInputType.text,
              obscureText: false),
          SizedBox(
            height: 15,
          ),
          FormInput(
              controller: _emailController,
              hintText: 'Correo@dominio.com',
              keyboardType: TextInputType.emailAddress,
              obscureText: false),
          SizedBox(
            height: 15,
          ),
          FormInput(
              controller: _contrasenaController,
              hintText: 'Contraseña',
              keyboardType: TextInputType.emailAddress,
              obscureText: true),
          SizedBox(
            height: 15,
          ),
          Container(
            width: Size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Paso1Cuenta()));
                String usuario = _userontroller.text;
                String email = _emailController.text;
                String contrasena = _contrasenaController.text;
                handleSubmit(usuario, email, contrasena, context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.black, width: 3),
                ),
                backgroundColor: Colors.black,
              ),
              child: Text(
                'CREAR CUENTA',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1,
                width: (Size.width * 0.8 - 100) / 2,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'O continúa con',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              Container(
                height: 1,
                width: (Size.width * 0.8 - 100) / 2,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Size.width * 0.9,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Lógica Google
                Navigator.pushNamed(context, routes.paso2Cuenta);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: Colors.black, width: 3),
                ),
                backgroundColor: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.google,
                    color: const Color.fromARGB(255, 49, 48, 48),
                  ),
                  SizedBox(
                      width:
                          5), // Ajusta el espacio entre la imagen y el texto según sea necesario
                  Text(
                    'Google',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleSubmit(String usuario, String email, String contrasena, BuildContext context) {
    // Esta función manejará la lógica para procesar el correo electrónico ingresado
    print("Correo electrónico ingresado: $email");
    print("contrasena ingresado: $contrasena");
    var userService = UserService();
    userService.setUsuario(usuario, email, contrasena, context);
  }
}
