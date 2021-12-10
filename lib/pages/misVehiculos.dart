import 'package:e_parking/modelos/vehicle.model.dart';
import 'package:e_parking/pages/registroVehicle.dart';
import 'package:e_parking/peticiones/vehicle.peticion.dart';
import 'package:flutter/material.dart';

class MisVehiculos extends StatelessWidget {
  static final String routeName = 'mis_vehiculos';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Vehículos'),
        backgroundColor: Colors.deepPurple,
      ),
      body: getVehicles(context, listVehicle()
    )
    );
  }

  Widget getVehicles(BuildContext context, Future<List<Vehicle>> futureVehicle) {
    return FutureBuilder(
      future: futureVehicle,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            if  (snapshot.hasError){
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
            return (snapshot.data != null) ?
                vehicleList(snapshot.data):
                Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text('Sin datos'),
                  ),
                );
          default: return Text('recarga la pantalla');

        }
      },
    );
  }

  Widget vehicleList(List<Vehicle> vehicles){
    return ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (_) => RegistroVehiculo()));
            },
          );
        },
        );
  }
}