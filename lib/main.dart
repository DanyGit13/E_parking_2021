import 'package:e_parking/pages/home_page.dart';
import 'package:e_parking/pages/Registro.dart';
import 'package:e_parking/pages/pagina_inicio.dart';
import 'package:e_parking/pages/pagina_principal.dart';
import 'package:e_parking/style_utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-parking',
      theme: CustomTheme.theme,
      initialRoute: Registro.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        Registro.routeName: (_) => Registro(),
        Inicio.routeName: (_) => Inicio(),
        PaginaPrincipal.routeName: (_) => PaginaPrincipal(),
      },
    );
  }
}
