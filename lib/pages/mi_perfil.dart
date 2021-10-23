import 'package:flutter/material.dart';


class Mi_perfil extends StatelessWidget {
  static final String routeName = 'mi_perfil';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi perfil'),
      ),
      body: Center(
        child: Container(
          child: Text('Mi perfil'),
        ),
      ),
    );
  }
}
