import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


getUsers() async {

  var url = Uri.parse('https://dummyjson.com/users');
  try {
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    print(data);
    return data['users'];
  } catch (e) {
    throw e;
  }
}
class User{
  String name;

  User({required this.name});
  factory User.fromJason(String, dynamic json){
  return User(name: json['firstName']);
  }
}