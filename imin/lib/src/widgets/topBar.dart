import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopBar extends StatelessWidget {
  final DocumentSnapshot item;
  TopBar({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,                                  // new
          end: Alignment.bottomRight,                                  // new
          // Add one stop for each color.
          // Stops should increase
          // from 0 to 1
          stops: [0.0, 1.0],
          colors: [
            // Colors are easy thanks to Flutter's
            // Colors class.
            Color.fromRGBO(206, 159, 252, 1.0),
            Color.fromRGBO(115, 103, 240, 1.0)
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(206, 159, 252, 1.0),
            offset: Offset.zero,
            blurRadius: 10.0,
          )
        ],
      ),
      child: Center(
        child: Text(
          'Hi Akhil',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),  
        ),
      ),
    );
  }
}