import 'dart:convert';
import 'package:e_parking/modelos/parking.model.dart';
import 'package:e_parking/modelos/vehicle.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



Future<List<Vehicle>> listVehicle() async {


  final response =
      await http.get(Uri.http("link.com",'http://192.168.100.39:3000/vehicles'));
  print(response.body);

  return compute(decodeJson, response.body);
}



List<Vehicle> decodeJson(String responseBody) {
  //aqui convertimos el body de la respuesta a JSON
  final myJson = json.decode(responseBody);
  //aqui convertimos el JSON a un objeto tipo vehiculo y lo retornamos
  return myJson['vehicles']
      .map<Vehicle>((json) => Vehicle.fromJson(json)).toList();
}


mapVehicle(Vehicle vehicle, bool mapId) {
  Map data;
  if (mapId) {
    data = {

      'plate': '${vehicle.plate}',
      'model': '${vehicle.model}',
      'brand': '${vehicle.brand}',
      'type': '${vehicle.type}',
    };
  } else {
    data = {

      'plate': '${vehicle.plate}',
      'model': '${vehicle.model}',
      'brand': '${vehicle.brand}',
      'type': '${vehicle.type}',
    };
  }

  return data;
}

Future<Vehicle> addVehicle(Vehicle vehicle) async {
  var url = Uri.parse('http://192.168.100.39:3000/vehicles');

  var body = json.encode(mapVehicle(vehicle, false));

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: body);
  print("${response}");

  if (response.statusCode == 200) {
    return Vehicle.fromJson(jsonDecode(response.body)['vehicle']);
  } else {
    throw Exception('Failed to load parking');
  }
}

Future<Vehicle> deleteVehicle(int vehicleId) async {
  print(vehicleId);
  final http.Response response = await http.delete(
    Uri.parse('http://192.168.100.39:3000/vehicles$vehicleId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Vehicle.fromJson(jsonDecode(response.body)['vehicle']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to Delete vehicle');
  }
}

Future<Vehicle> modifyVehicle(Vehicle vehicle) async {
  var url = Uri.parse('http://192.168.100.39:3000/vehicles');

  var body = json.encode(mapVehicle(vehicle, true));
  print(body);

  var response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 200) {
    return Vehicle.fromJson(jsonDecode(response.body)['vehicle']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to modify vehicle');
  }
}
