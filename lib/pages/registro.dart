import 'package:flutter/material.dart';
import 'package:e_parking/style_utils.dart';

class Registro extends StatelessWidget {
  static final String routeName = 'registro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello Registro'),
        ),
      ),
    );
  }
}
