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
          begin: Alignment.bottomRight,                                  // new
          end: Alignment.topLeft,                                  // new
          // Add one stop for each color.
          // Stops should increase
          // from 0 to 1
          stops: [0.0, 1.0],
          colors: [
            // Colors are easy thanks to Flutter's
            // Colors class.
            // Color.fromRGBO(253, 235, 113, 1.0),
            // Color.fromRGBO(248, 216, 0, 1.0)
            Color.fromRGBO(206, 159, 252, 1.0),
            Color.fromRGBO(115, 103, 240, 1.0),
          ],
        ),
        //color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromRGBO(0, 0, 0, 0.1),
        //     offset: Offset(0.0, 0.0),
        //     blurRadius: 40.0,
        //     spreadRadius: 0.0,
        //   ),
        // ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${item.data['name']}",
            
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          Text(
            "@${item.data['location']}",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          Container(
            height: 10.0
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.place, color: Colors.white,),
                    Container(width: 5.0,),
                    Text(
                      "${item.data['date']}",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Icon(Icons.people, color: Colors.white,),
                    Container(width: 5.0,),
                    Text(
                      "${item.data['going'].length} person going",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}