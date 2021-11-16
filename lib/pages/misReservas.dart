import 'package:flutter/material.dart';
import 'package:e_parking/pages/menuPrincipal.dart';
import 'package:e_parking/style_utils.dart';
import 'package:flutter/services.dart';

class MisReservas extends StatelessWidget {
  static final String routeName = 'mis_reservas';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Color.fromARGB(222, 229, 229, 126),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 110,
            height: 110,
           // child: Image.asset('assets/Image_1@1x.png'),
          )
        ],
        //child: Text('Mis Reservas'),
      ),
    );
  }
}