import 'package:flutter/material.dart';

class PaginaPrincipal extends StatelessWidget {
  static final String routeName = 'principal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello principal'),
        ),
      ),
    );
  }
}
