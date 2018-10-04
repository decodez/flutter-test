import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventTile extends StatelessWidget {
  final DocumentSnapshot item;

  EventTile({this.item});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          trailing: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '${item['name']}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              
              Row(
                children: <Widget>[
                  Row (
                    children: <Widget>[
                      Icon(Icons.event),
                      Text('${item['date']}'),
                    ],
                  ),
                  Row (
                    children: <Widget>[
                      Icon(Icons.place),
                      Text('${item['location']}'),
                    ],
                  ),
                ],
              ),
            ],
          ),          
          
          
        ),
        Divider(
          height: 8.0,
        ),
      ],
    );
  }
}