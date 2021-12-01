import 'dart:convert';

import 'package:e_parking/modelos/cliente.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Client>> listClient() async {
  final response =
      await http.get(Uri.parse('http://192.168.100.39:4002/api/clientes'));
  print(response.body);

  return compute(goToList, response.body);
}

List<Client> goToList(String responseBody) {
  //aqui convertimos el body de la respuesta a JSON
  final pasar = json.decode(responseBody);
  //aqui convertimos el JSON a un objeto tipo CLient y lo retornamos
  return pasar['clientes']
      .map<Client>((json) => Client.fromJson(json))
      .toList();
}

mapClient(Client client, bool mapId) {
  Map data;
  if (mapId) {
    data = {
      '_id': '${client.id}',
      'nombre': '${client.name}',
      'apellido': '${client.surname}',
      'telefono': '${client.phone}',
      'email': '${client.email}',
      'id': '${client.DNI}',
      'password': '${client.password}',
    };
  } else {
    data = {
      'nombre': '${client.name}',
      'apellido': '${client.surname}',
      'telefono': '${client.phone}',
      'email': '${client.email}',
      'id': '${client.DNI}',
      'password': '${client.password}',
    };
  }

  return data;
}

Future<Client> addClient(Client client) async {
  var url = Uri.parse('http://192.168.100.39:4002/api/clientes/registro');

  var body = json.encode(mapClient(client, false));

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: body);
  print("${response}");

  if (response.statusCode == 200) {
    return Client.fromJson(jsonDecode(response.body)['cliente']);
  } else {
    throw Exception('Failed to load client');
  }
}

Future<Client> deleteClient(String clientId) async {
  print(clientId);
  final http.Response response = await http.delete(
    Uri.parse('http://192.168.100.39:4002/api/clientes/eliminar/$clientId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Client.fromJson(jsonDecode(response.body)['cliente']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to Delete client');
  }
}

Future<Client> modifyClient(Client client) async {
  var url = Uri.parse('http://192.168.100.39:4002/api/clientes/modificar');

  var body = json.encode(mapClient(client, true));
  print(body);

  var response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 200) {
    return Client.fromJson(jsonDecode(response.body)['cliente']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to modify client');
  }
}
