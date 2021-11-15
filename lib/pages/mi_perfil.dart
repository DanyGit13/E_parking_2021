import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Mi_perfil extends StatelessWidget {
  static final String routeName = 'mi_perfil';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditarPerfil(),
    );
  }
}

class EditarPerfil extends StatefulWidget {

  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
    late File _imageFile;
  final _picker = ImagePicker();
  @override

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.deepPurple,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.deepPurple,
            ),
            onPressed: () {},
          ),
        ],
      ),*/
      body: Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Editar Perfil",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              imageProfile(),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField(
                  "Nombre Completo", "Daniel Guerrero Delgado", false),
              buildTextField("Numero telefonico", "+50687360481", false),
              buildTextField("Email", "daniel.guerrero13@outlook.com", false),
              buildTextField("Cambiar Contraseña", "*********", true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: (){},
                    child: Text("Cancelar",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.deepPurple)),
                  ),
                  RaisedButton(
                      onPressed: (){},
                      color: Colors.deepPurpleAccent,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    child: Text("Guardar", style: TextStyle(
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

  Widget imageProfile(){
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage("assets/Perfil_imagen.png")

            /*_imageFile==null? AssetImage("assets/Perfil_imagen.png"):FileImage(File(_imageFile.path)),*/
          ),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                  );
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.teal,
                  size: 28.0,
                ),
              ),
          ),

        ],
      ),
    );
  }

  Widget bottomSheet(){
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(children: <Widget>[
        Text(
          "Escoger Foto de Perfil",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.camera),
              onPressed: () {
                  tomarFoto(ImageSource.camera);
              },
              label: Text("Camara"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.add_photo_alternate),
              onPressed: () {
                tomarFoto(ImageSource.gallery);
              },
              label: Text("Galeria"),
            )
          ]
        )
      ],
      ),
    );
  }

  void tomarFoto(ImageSource source) async{
    var pickedFile = await _picker.pickImage(
        source: source,
    );
    setState(() {
      _imageFile = pickedFile as File;
    });
  }



    Widget nameTextField() {
      return TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
           color: Colors.orange,
           width: 2,
            )
          )
        ),
      );
    }


  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword: false,
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
