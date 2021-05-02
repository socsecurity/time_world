import 'package:flutter/material.dart';
import 'package:time_world/pages/home.dart';
import 'package:time_world/pages/choose_location.dart';
import 'package:time_world/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
