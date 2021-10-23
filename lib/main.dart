import 'package:e_parking/pages/menu_principal.dart';
import 'package:e_parking/pages/registro_en_aplicacion.dart';
import 'package:e_parking/pages/pantalla_inicial.dart';
import 'package:e_parking/pages/pagina_principal.dart';
import 'package:e_parking/style_utils.dart';
import 'package:flutter/material.dart';

import 'pages/inicio_sesion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-parking',
      theme: CustomTheme.theme,
      initialRoute: Pagina_principal.routeName,
      routes: {
        Menu_principal.routeName: (_) => Menu_principal(),
        Pantalla_inicial.routeName: (_) => Pantalla_inicial(),
        Inicio_sesion.routeName: (_) => Inicio_sesion(),
        Pagina_principal.routeName: (_) => Pagina_principal(),
        Registro_aplicacion.routeName: (_) => Registro_aplicacion(),
      },
    );
  }
}
