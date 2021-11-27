import 'package:e_parking/pages/menuPrincipal.dart';
import 'package:e_parking/pages/recuperaPassword.dart';
import 'package:e_parking/pages/registroAplicacion.dart';
import 'package:e_parking/style_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';
import 'package:flutter/services.dart';

class InicioSesion extends StatelessWidget {
  static final String routeName = 'inicio_sesion';
  final correo = TextEditingController();
  final Password = TextEditingController();

  String email = '';
  String Pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple,

      backgroundColor: Color.fromARGB(255, 87, 34, 126),
      appBar: AppBar(
        elevation: 0,
        title: Text('Inicio de sesión'),
        centerTitle: true,
      ),

      body: Container(

        decoration: BoxDecoration( // color de fondo de pantalla
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end:  Alignment.center,
                stops: [0.5,0.5,1,2],
                colors: [Color.fromARGB(255, 87, 34, 126),Color.fromARGB(255, 87, 34, 126), Color.fromARGB(255, 87, 34, 126), Color.fromARGB(255, 87, 34, 126)]
            )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Image.asset('assets/Image_1@1x.png',
              height: 300.0,),
            ),
            SizedBox(height: 15.0,),
            _userTextField(),
            SizedBox(height: 15,),
            _passwTextField(),
            SizedBox(height: 20.0,),
            _btnLogin(),
            Text(''),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                    "→ ¿Olvidó su contraseña?", style: TextStyle(fontSize: 15, color: Colors.lightBlueAccent,fontWeight: FontWeight.bold )
                ),
                onPressed: (){
                  Navigator.of(context).pushNamed(RecuperarPassword.routeName);
                  },
              ),
            ),

            Divider( color: Colors.grey,indent: 40,endIndent: 40,height: 10,thickness: 2.0,),
            SizedBox(
              height:10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Text('¿No tienes cuenta?',style: TextStyle(fontSize: 13, color: Colors.white,fontWeight: FontWeight.bold )),
                CupertinoButton(child: Text("Registrarse",style: TextStyle(color: Colors.lightBlue )), onPressed: () {
                  Navigator.of(context).pushNamed(RegistroAplicacion.routeName);
                }
                )
              ],
            ),
          ],

        ),


        //children:<Widget> [

        // Container(
        //    padding: EdgeInsets.all(10.0),
        //    child: Image.asset('Image_1@1x.png', width: 720,height: 150,)
        //child: Container(
        // width: 620,
        // height: 250,
        // color: Colors.deepPurpleAccent,
        //  alignment: Alignment.bottomCenter,
        // child: Image.asset('Image_1@1x.png', fit: BoxFit.fitWidth, ), //Text('Inicio de sesion'),

        //padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
        //margin: EdgeInsets.all(20),
        // ),
        // ),
        //  Container(
        //     child: TextField(decoration: InputDecoration(
        //         hintText:"Digite su correo",
        //        labelText: "Correo",
        //       labelStyle: TextStyle(
        //          fontSize: 24,
        //          color:Colors.black
        //     )
        //     ),
        //     keyboardType: TextInputType.emailAddress,
        //   ),
        //    ),
        //    Container(
        //   child: TextField(decoration: InputDecoration(
        //        hintText:"Digite su contraseña",
        //       labelText: "Contraseña",
        //      labelStyle: TextStyle(
        //           fontSize: 24,
        //           color:Colors.black
        //        )
        //   ),
        //     keyboardType: TextInputType.visiblePassword,
        //     obscureText: false,
        //     ),
        //   )
        // ],
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: ( BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: correo,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
                // hintStyle: TextStyle(color: Colors.white),

                //fillColor: Colors.white,
                icon: Icon(Icons.email),
                hintText: 'ejemplo@dominio.com',
                labelText: 'Correo',
              ),
              onChanged: (value){

              },
            ),

          );
        }
    );
  }

  Widget _passwTextField() {

    return StreamBuilder(

        builder: (BuildContext context, AsyncSnapshot snapshot){

          return Container(

            padding: EdgeInsets.symmetric(horizontal: 20.0,),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: Password,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
                //fillColor: Colors.white,
                icon: Icon(Icons.security),
                hintText: 'Contraseña',
                labelText: 'Contraseña',
              ),
              onChanged: (value){

              },
            ),
          );
        }
    );
  }

  Widget _btnLogin() {
    return StreamBuilder(

        builder: (BuildContext context, AsyncSnapshot snapshot){
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
              child: Text('Iniciar sesion',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight:FontWeight.bold,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            elevation: 10.0,
            color:Colors.blue,

            onPressed: (){
              email = correo.text;
              Pass = Password.text;
              if(email == 'ivan_ali@live.com' && Pass == '123456') {
                Navigator.of(context).pushNamed(MenuPrincipal.routeName);
              }else{
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('Inicio sesion'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: [
                          Text('Verifica tus datos')],
                      ),
                    ),
                    actions: [
                      FlatButton(child: Text('Aceptar'),
                        onPressed: (){
                        Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(child: Text('Cancelar'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                },

                );
              }
            },
          );
        }
    );

  }


}
