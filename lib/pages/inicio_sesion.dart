import 'package:e_parking/style_utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';

class Inicio_sesion extends StatelessWidget {
  static final String routeName = 'inicio_sesion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-parking'),
      ),
      body: Center(
        child: Container(
          child: Text('Inicio de sesion'),
        ),
      ),
    );
  }
}
