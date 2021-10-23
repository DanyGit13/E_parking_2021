import 'package:flutter/material.dart';

class Pantalla_inicial extends StatelessWidget {
  static final String routeName = 'pantalla_inicial';
  Color _color = Color.fromARGB(255, 87, 34, 126);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Center(
        child: Container(
          child: Image.asset('assets/Image_1@1x.png'),
        ),
      ),
    );
  }
}
