import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pantalla_inicial extends StatelessWidget {
  static final String routeName = 'pantalla_inicial';
  Color _color = Color.fromARGB(255, 87, 34, 126);
  double progress = 0;
  int _duracion = 5;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/Image_1@1x.png'),
            LinearProgressIndicator(),

          ]
      ),
    );
  }
}


