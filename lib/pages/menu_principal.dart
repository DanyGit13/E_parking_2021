import 'package:e_parking/style_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';

class Menu_principal extends StatefulWidget {
  static final String routeName = 'menu_principal';
  EstadoMenu createState() => EstadoMenu();

}

class EstadoMenu extends State<Menu_principal> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
      ),
      body: Center(),
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
            onTap: () {},
          ),
          ListTile(
            title: Text('Método de pago'),
            leading: Icon(Icons.attach_money),
            onTap: () {},
          ),
          ListTile(
            title: Text('Mis vehículos'),
            leading: Icon(Icons.airport_shuttle_sharp),
            onTap: (){},
          ),
          ListTile(
            title: Text('Mis reservas'),
            leading: Icon(Icons.assignment),
            onTap: () {},
          ),
          ListTile(
            title: Text('Configuración de privacidad'),
            leading: Icon(Icons.privacy_tip_outlined),
            onTap: () {},
          ),
          ListTile(
            title: Text('Ayuda y soporte'),
            leading: Icon(Icons.support_agent),
            onTap: () {},
          ),
          ListTile(
            title: Text('Contáctanos'),
            leading: Icon(Icons.call_outlined),
            onTap: () {},
          ),
        ]),
      ),
    );
  }

}