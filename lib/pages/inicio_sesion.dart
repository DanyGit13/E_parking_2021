import 'package:e_parking/style_utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';

class Inicio_sesion extends StatelessWidget {
  static final String routeName = 'inicio_sesion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Column(
        children:<Widget> [
          Container(
              padding: EdgeInsets.all(10.0),
               child: Image.asset('Image_1@1x.png', width: 720,height: 150,)
            //child: Container(
             // width: 620,
             // height: 250,
             // color: Colors.deepPurpleAccent,
            //  alignment: Alignment.bottomCenter,
             // child: Image.asset('Image_1@1x.png', fit: BoxFit.fitWidth, ), //Text('Inicio de sesion'),

              //padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
              //margin: EdgeInsets.all(20),
           // ),
          ),
          Container(
            child: TextField(decoration: InputDecoration(
                hintText:"Digite su correo",
                labelText: "Correo",
                labelStyle: TextStyle(
                    fontSize: 24,
                    color:Colors.black
                )
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            child: TextField(decoration: InputDecoration(
                hintText:"Digite su contraseña",
                labelText: "Contraseña",
                labelStyle: TextStyle(
                    fontSize: 24,
                    color:Colors.black
                )
            ),
              keyboardType: TextInputType.text,
              obscureText: false,
            ),
          )
        ],
      ),
    );
  }
}
