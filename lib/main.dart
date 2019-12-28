import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import './ui.dart';

void main() async {
  List currencies = await getCurrency();
  // print(currencies);
  runApp(Myapp(currencies));
}

class Myapp extends StatelessWidget {
  final List _currencies;
  Myapp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(_currencies),
      theme: ThemeData(primarySwatch: Colors.pink,
    ));
  }
}

Future<List> getCurrency() async {
  String url = "https://api.coinmarketcap.com/v1/ticker/?limit=50";

  http.Response response = await http.get(url);

  return json.decode(response.body);
}
