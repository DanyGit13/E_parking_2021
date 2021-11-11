import 'package:e_parking/pages/inicio_sesion.dart';
import 'package:e_parking/style_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mi_perfil.dart';
import 'metodo_pago.dart';
import 'mis_reservas.dart';
import 'mis_vehiculos.dart';
import 'ayuda_soporte.dart';
import 'contactanos.dart';
import 'configuracion_privacidad.dart';


import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';

class Menu_principal extends StatefulWidget {
  static final String routeName = 'menu_principal';
  EstadoMenu createState() => EstadoMenu();

}

class EstadoMenu extends State<Menu_principal> {
  int  selectDrawerItem = 0;



  _getDrawerItemWidget(int posicion){
    switch(posicion){
      case 0: return Mi_perfil();
      case 1: return MetodoPago();
      case 2: return MisVehiculos();
      case 3: return MisReservas();
      case 4: return ConfiguracionPrivacidad();
      case 5: return AyudaSoporte();
      case 6: return Contactanos();
      case 7: return Inicio_sesion();

    }
  }

  onSelectItem(int posicion){
    Navigator.of(context).pop();
    setState(() {
      selectDrawerItem = posicion;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('dany13gd'),
            accountEmail: Text('dany13gd@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(
                'DA',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            title: Text('Mi perfil'),
            leading: Icon(Icons.account_box_outlined),
            onTap: () {
              onSelectItem(0);
            },
          ),
          ListTile(
            title: Text('Método de pago'),
            leading: Icon(Icons.attach_money),
            onTap: () {
              onSelectItem(1);
            },
          ),
          ListTile(
            title: Text('Mis vehículos'),
            leading: Icon(Icons.airport_shuttle_sharp),
            onTap: (){
              onSelectItem(2);
            },
          ),
          ListTile(
            title: Text('Mis reservas'),
            leading: Icon(Icons.assignment),
            onTap: () {
              onSelectItem(3);
            },
          ),
          ListTile(
            title: Text('Configuración de privacidad'),
            leading: Icon(Icons.privacy_tip_outlined),
            onTap: () {
              onSelectItem(4);
            },
          ),
          ListTile(
            title: Text('Ayuda y soporte'),
            leading: Icon(Icons.support_agent),
            onTap: () {
              onSelectItem(5);
            },
          ),
          ListTile(
            title: Text('Contáctanos'),
            leading: Icon(Icons.call_outlined),
            onTap: () {
              onSelectItem(6);
            },
          ),
          ListTile(
            title: Text('Inicio de Sesion'),
            leading: Icon(Icons.call_outlined),
            onTap: () {
              onSelectItem(7);
            },
          ),
        ]),
      ),
      body: _getDrawerItemWidget(selectDrawerItem),
    );
  }

}