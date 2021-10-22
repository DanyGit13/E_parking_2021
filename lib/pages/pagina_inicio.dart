import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  static final String routeName = 'inicio';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello inicio'),
        ),
      ),
    );
  }
}
