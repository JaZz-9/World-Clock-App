import 'package:flutter/material.dart';
import 'package:try2/pages/home.dart';
import 'package:try2/pages/loading.dart';
import 'package:try2/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),

  },
));