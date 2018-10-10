import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './src/app.dart';
import './src/screens/signup_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Baby Names',
      theme: ThemeData(fontFamily: 'Raleway'),
      home: SignupScreen(),
    );
  }
}
