import 'package:e_parking/pages/mapaPage.dart';
import 'package:e_parking/pages/menuPrincipal.dart';
import 'package:e_parking/pages/miPerfil.dart';
import 'package:e_parking/pages/misReservas.dart';
import 'package:e_parking/pages/recuperaPassword.dart';
import 'package:e_parking/pages/registroAplicacion.dart';
import 'package:e_parking/pages/pantallaInicial.dart';
import 'package:e_parking/pages/paginaPrincipal.dart';
import 'package:e_parking/pages/registroVehicle.dart';
import 'package:e_parking/style_utils.dart';
import 'package:flutter/material.dart';
import 'pages/inicioSesion.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-parking',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: RegistroVehiulo.routeName,

      routes: {
        MenuPrincipal.routeName: (_) => MenuPrincipal(),
        Pantalla_inicial.routeName: (_) => Pantalla_inicial(),
        InicioSesion.routeName: (_) => InicioSesion(),
        Pagina_principal.routeName: (_) => Pagina_principal(),
        RegistroAplicacion.routeName: (_) => RegistroAplicacion(),
        MiPerfil.routeName: (_) => MiPerfil(),
        RecuperarPassword.routeName: (_) => RecuperarPassword(),
        MapaPage.routeName: (_) => MapaPage(),
        RegistroVehiulo.routeName: (_) => RegistroVehiulo(),

      },
    );
  }
}
