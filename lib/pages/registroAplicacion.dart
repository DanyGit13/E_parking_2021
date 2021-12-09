import 'package:e_parking/pages/inicioSesion.dart';
import 'package:e_parking/pages/menuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:e_parking/modelos/cliente.model.dart';
import 'package:e_parking/pages/text_box.dart';
import 'package:e_parking/peticiones/cliente.peticion.dart';

import 'mapaPage.dart';


class RegistroAplicacion extends StatelessWidget {
  static final String routeName = 'registro_aplicacion';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: CrearRegistro(),
    );
  }
}

class CrearRegistro extends StatefulWidget {
  _CrearRegistroState createState() => _CrearRegistroState();

}



class _CrearRegistroState extends State<CrearRegistro> {
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  var _imageFile = null;

  bool showPassword = false;


  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerEmail = new TextEditingController();
    controllerPassword = new TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Registrar Usuario'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InicioSesion()));
          },),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 2, top: 0, right: 2),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 0,
              ),
              SizedBox(
                height: 0,
              ),
              TextBox(controllerName,"Nombre"),
              TextBox(controllerEmail, "email"),
              TextBox(controllerPassword,"Contraseña"),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InicioSesion()));
                    },
                    child: Text("Cancelar",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.deepPurple)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      String name = controllerName.text;
                      String email = controllerEmail.text;
                      String password = controllerPassword.text;

                      if (name.isNotEmpty &&
                          email.isNotEmpty &&
                          password.isNotEmpty) {
                        User c =
                        new User(name: name, email: email, password: password);

                        addUser(c).then((client) {
                          if (client.email != '') {
                            print('Cliente registrado...!');
                            Navigator.of(context).pushNamed(MapaPage.routeName);
                          }
                        });
                      }
                    },
                    color: Colors.deepPurpleAccent,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Guardar",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.deepPurple),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(controller,
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.deepPurple,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
