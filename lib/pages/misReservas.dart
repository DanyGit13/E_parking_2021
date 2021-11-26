import 'package:flutter/material.dart';
import 'package:e_parking/pages/menuPrincipal.dart';
import 'package:e_parking/style_utils.dart';
import 'package:flutter/services.dart';

class MisReservas extends StatelessWidget {
  static final String routeName = 'mis_reservas';
  final List <String> Reservaciones = [
        '9:00am - San Jose, avenida central',
        'Paseo Colon',
        'Merced',
        'Uruca','San Jose',
        'San Jose',
        'Paseo Colon',
        'Merced',
        'Uruca','San Jose',
        'San Jose',
        'Paseo Colon',
        'Merced',
        'Uruca','San Jose',
        'San Jose',
        'Paseo Colon',
        'Merced',
        'Uruca','San Jose',
        'San Jose',
        'Paseo Colon',
        'Merced',
        'Uruca','San Jose',
        'San Jose',
        'Paseo Colon',
        'Merced',
        'Uruca','San Jose',
        'San Jose',
        'Paseo Colon',
        'Merced',
        'Uruca','San Jose',
        'San Jose',
        'Paseo Colon',
        'Merced',
        'Uruca','San Jose'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 34, 126),
      appBar: AppBar(
        elevation: 0,
        title: Text('Mis reservaciones'),
        centerTitle: true,
      ),
        body: ListView.builder(
          itemCount: Reservaciones.length,
          itemBuilder: (context,position){
            return Reservas(Reservaciones[position]);
          },
        ),
      );
  }
}

class Reservas extends StatelessWidget{
  String Reserv;
  Reservas(this.Reserv){}
  @override
  Widget build(BuildContext context) {
    return Card(
     child: Center(
       child: Text(Reserv),
     ),
    );
  }
}