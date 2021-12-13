import 'package:e_parking/modelos/vehicle.model.dart';
import 'package:e_parking/pages/registroVehicle.dart';
import 'package:e_parking/peticiones/vehicle.peticion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MisVehiculos extends StatefulWidget {
  static final String routeName = 'mis_vehiculos';


  @override
  State<MisVehiculos> createState() => _MisVehiculosState();
}



class _MisVehiculosState extends State<MisVehiculos> {


  List<Vehicle> data = <Vehicle>[];

 // @override
 /* void initState() {
*//*    listVehicle().then((vehicles) {
      for (var item in vehicles) {
        Text(item.plate);
        Text(item.type);
        Text(item.model);
        Text(item.type);
      }
    });*//*
    super.initState();
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Vehiculos'),
      ),
      body: getVehicles(context, listVehicle()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => RegistroVehiculo()))
              .then((newVehicle) {
                if(newVehicle != null) {
                  setState(() {
                    Text(" a sido guardado...!");
                  });
                }
          });
        },
        tooltip: "Agregar Contacto",
        child: Icon(Icons.add),
      ),
    );
  }

  removeVehicle(BuildContext context, Vehicle vehicle) {
    showDialog(
        context: context,
        builder: (_) =>
            AlertDialog(
              title: Text("Eliminar Cliente"),
              content: Text(
                  "Esta seguro de eliminar a " + vehicle.plate + "?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      deleteVehicle(vehicle.plate).then((vehicle) {
                        if (vehicle.plate != '') {
                          setState(() {});
                        }
                      });
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }

  Widget getVehicles(BuildContext context,
      Future<List<Vehicle>> futureVehicule) {
    return FutureBuilder(
      future: futureVehicule,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
        //En este case estamos a la espera de la respuesta, mientras tanto mostraremos el cargando...
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            if (snapshot.hasError) {
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Error: ${snapshot.error}'),
                ),
              );
            }
            // print(snapshot.data);
            return snapshot.data != null
                ? vehicleList(snapshot.data)
                : Container(
              alignment: Alignment.center,
              child: Center(
                child: Text('Sin Datos'),
              ),
            );

          default:
            return Text('Recarga la pantalla....!');
        }
      },
    );
  }

  Widget vehicleList(List<Vehicle> vehicles) {
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => RegistroVehiculo()))
                .then((newVehicle) {
              setState(() {
                vehicles.removeAt(index);
                vehicles.insert(index, newVehicle);

                Text(" a sido modificado...!");
              });
            });
          },
          title: Text(vehicles[index].type +  vehicles[index].model),
          subtitle: Text(vehicles[index].plate),
          trailing: Icon(
            Icons.airport_shuttle,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
class Vehiculos extends StatelessWidget{
  late String vehi;
  Vehiculos(this.vehi){}
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(vehi),
      ),
    );
  }
}
