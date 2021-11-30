import 'package:e_parking/pages/inicioSesion.dart';
import 'package:e_parking/pages/menuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';
import 'registroAplicacion.dart';

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
  var _imageFile = null;

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Registrar'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InicioSesion()));
          },),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              buildTextField(
                  "Nombre Completo", "Nombre", false),
              buildTextField("Numero telefonico", " ", false),
              buildTextField("Email", "email", false),
              buildTextField("Contraseña", "*********", true),
              buildTextField("Confirmar Contraseña", "*********", true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("Cancelar",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.deepPurple)),
                  ),
                  RaisedButton(
                    onPressed: () {},
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
  Widget buildTextField(
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
