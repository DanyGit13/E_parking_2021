import 'dart:convert';
import 'package:e_parking/modelos/parking.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Parking>> listParking() async {
  final response =
  await http.get(Uri.parse('http://192.168.100.39:3000/parkings'));
  print(response.body);

  return compute(goToList, response.body);
}

List<Parking> goToList(String responseBody) {
  //aqui convertimos el body de la respuesta a JSON
  final pasar = json.decode(responseBody);
  //aqui convertimos el JSON a un objeto tipo CLient y lo retornamos
  return pasar['parkings']
      .map<Parking>((json) => Parking.fromJson(json))
      .toList();
}

mapParking(Parking parking, bool mapId) {
  Map data;
  if (mapId) {
    data = {

      'name': '${parking.name}',
      'description': '${parking.description}',
      'phone': '${parking.phone}',
      'price': '${parking.price}',
    };
  } else {
    data = {

      'name': '${parking.name}',
      'description': '${parking.description}',
      'phone': '${parking.phone}',
      'price': '${parking.price}',
    };
  }

  return data;
}

Future<Parking> addParking(Parking parking) async {
  var url = Uri.parse('http://192.168.100.39:3000/users');

  var body = json.encode(mapParking(parking, false));

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: body);
  print("${response}");

  if (response.statusCode == 200) {
    return Parking.fromJson(jsonDecode(response.body)['parking']);
  } else {
    throw Exception('Failed to load parking');
  }
}

Future<Parking> deleteParking(String parkingId) async {
  print(parkingId);
  final http.Response response = await http.delete(
    Uri.parse('http://192.168.100.39:3000/parkings$parkingId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Parking.fromJson(jsonDecode(response.body)['parking']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to Delete client');
  }
}

Future<Parking> modifyParking(Parking parking) async {
  var url = Uri.parse('http://192.168.100.39:3000/parkings');

  var body = json.encode(mapParking(parking, true));
  print(body);

  var response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 200) {
    return Parking.fromJson(jsonDecode(response.body)['parking']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to modify parking');
  }
}