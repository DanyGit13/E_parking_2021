import 'package:e_parking/pages/inicioSesion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'miPerfil.dart';
import 'metodoPago.dart';
import 'misReservas.dart';
import 'misVehiculos.dart';
import 'ayudaSoporte.dart';
import 'contactanos.dart';
import 'configuracionPrivacidad.dart';
import 'mapaPage.dart';



class MenuPrincipal extends StatefulWidget {
  static final String routeName = 'menu_principal';
  EstadoMenu createState() => EstadoMenu();

}

class EstadoMenu extends State<MenuPrincipal> {
  int  selectDrawerItem = 5;



  _getDrawerItemWidget(int posicion){
    switch(posicion){
      case 0: return MiPerfil();
      case 1: return MisVehiculos();
      case 2: return MisReservas();
      case 3: return AyudaSoporte();
      case 4: return Contactanos();
      case 5: return MapaPage();

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
            title: Text('Mis vehículos'),
            leading: Icon(Icons.airport_shuttle_sharp),
            onTap: (){
              onSelectItem(1);
            },
          ),
          ListTile(
            title: Text('Mis reservas'),
            leading: Icon(Icons.assignment),
            onTap: () {
              onSelectItem(2);
            },
          ),
          ListTile(
            title: Text('Ayuda y soporte'),
            leading: Icon(Icons.support_agent),
            onTap: () {
              onSelectItem(3);
            },
          ),
          ListTile(
            title: Text('Contáctanos'),
            leading: Icon(Icons.call_outlined),
            onTap: () {
              onSelectItem(4);
            },
          ),
        ]),
      ),
      body: _getDrawerItemWidget(selectDrawerItem),
    );
  }

}