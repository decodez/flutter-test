import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventTile extends StatelessWidget {
  final DocumentSnapshot item;

  EventTile({this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
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
            Color.fromRGBO(253, 235, 113, 1.0),
            Color.fromRGBO(248, 216, 0, 1.0)
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Text("${item.data['name']}"),
          Text("${item.data['location']}"),
          Text("${item.data['date']}"),
          Text("${item.data['going'].length} person going"),
        ],
      ),
    );
  }
}