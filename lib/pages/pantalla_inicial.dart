import 'package:flutter/material.dart';

class Pantalla_inicial extends StatelessWidget {
  static final String routeName = 'pantalla_inicial';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Center(
        child: Container(
          child: Text('Pantalla Inicial'),
        ),
      ),
    );
  }
}
