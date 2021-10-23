import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';

class Registro_aplicacion extends StatelessWidget {
  static final String routeName = 'registro_aplicacion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Center(
        child: Container(
          child: Text('Registro'),
        ),
      ),
    );
  }
}
