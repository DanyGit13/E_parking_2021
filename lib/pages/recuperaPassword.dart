import 'package:e_parking/pages/inicioSesion.dart';
import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';

class RecuperarPassword extends StatelessWidget {
  static final String routeName = 'recuperar_password';
  final correo = TextEditingController();

  String email2= '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Recuperar contraseña'),
      ),
      body: Container(

        decoration: BoxDecoration( // color de fondo de pantalla
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end:  Alignment.center,
                stops: [0.5,0.5,1,2],
                colors: [Color.fromARGB(166, 165, 165, 165),Color.fromARGB(166, 165, 165, 165), Color.fromARGB(166, 165, 165, 165), Color.fromARGB(166, 165, 165, 165)]
            )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
            //Flexible(child: Image.asset('assets/Image_1@1x.png',
             // height: 300.0,),
        //    ),
            SizedBox(height: 15.0,),
            _userTextField(),
            SizedBox(height: 15,),
            _btnLogin(),
            Text(''),
            Divider( color: Colors.grey,indent: 40,endIndent: 40,height: 10,thickness: 2.0,),
            SizedBox(
              height:10,
            ),

          ],

        ),
      ),

    );
  }
}


Widget _userTextField() {
  return StreamBuilder(
      builder: ( BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            //controller:correo,
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



Widget _btnLogin() {
  return StreamBuilder(

      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 15.0),
            child: Text('Enviar e-mail',
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

            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text('Inicio sesion'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text('La contraseña temporal se envio a su correo registrado')],
                  ),
                ),
                actions: [
                  FlatButton(child: Text('Aceptar'),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },

            );
          //  showDialog(context: context, builder: (BuildContext context) => const AlertDialog(title: Text('La contraseña temporal se envio a su correo registrado')));

           // Navigator.of(context).pushNamed(InicioSesion.routeName);
            // email2 = correo2.text;
          },
        );
      }
  );

}