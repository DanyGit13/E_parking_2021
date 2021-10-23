import 'package:flutter/material.dart';

class Pagina_principal extends StatelessWidget {
  static final String routeName = 'pagina_principal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
      ),
      body: Center(
        child: Container(
          child: Text(
            'Pagina principal de eparking',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}





