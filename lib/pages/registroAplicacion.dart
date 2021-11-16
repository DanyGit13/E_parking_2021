import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';

class RegistroAplicacion extends StatelessWidget {
  static final String routeName = 'Registro aplicación';

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
