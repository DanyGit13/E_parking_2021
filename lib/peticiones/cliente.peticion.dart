import 'dart:convert';

import 'package:e_parking/modelos/cliente.model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<User>> listUser() async {
  final response =
      await http.get(Uri.parse('http://192.168.100.39:3000/users'));
  print(response.body);

  return compute(goToList, response.body);
}

List<User> goToList(String responseBody) {
  //aqui convertimos el body de la respuesta a JSON
  final pasar = json.decode(responseBody);
  //aqui convertimos el JSON a un objeto tipo CLient y lo retornamos
  return pasar['user']
      .map<User>((json) => User.fromJson(json))
      .toList();
}

mapUser(User user, bool mapId) {
  Map data;
  if (mapId) {
    data = {

      'name': '${user.name}',
      'email': '${user.email}',
      'password': '${user.password}',
    };
  } else {
    data = {

      'name': '${user.name}',
      'email': '${user.email}',
      'password': '${user.password}',
    };
  }

  return data;
}

Future<User> addUser(User user) async {
  var url = Uri.parse('http://192.168.100.39:3000/users');

  var body = json.encode(mapUser(user, false));

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'}, body: body);
  print("${response}");

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body)['user']);
  } else {
    throw Exception('Failed to load user');
  }
}

Future<User> deleteUser(String userId) async {
  print(userId);
  final http.Response response = await http.delete(
    Uri.parse('http://192.168.100.39:3000/users$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body)['user']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to Delete client');
  }
}

Future<User> modifyClient(User user) async {
  var url = Uri.parse('http://192.168.100.39:3000/users');

  var body = json.encode(mapUser(user, true));
  print(body);

  var response = await http.put(url,
      headers: {"Content-Type": "application/json"}, body: body);
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body)['user']);
  } else {
    print(response.statusCode);
    throw Exception('Failed to modify client');
  }
}
