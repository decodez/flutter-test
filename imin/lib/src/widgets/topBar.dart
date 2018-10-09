import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopBar extends StatelessWidget {
  final DocumentSnapshot item;
  TopBar({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
      height: MediaQuery.of(context).size.height*1/6,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1), width: 1.0)),
        color:  Colors.white,
      
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,                                  // new
        //   end: Alignment.bottomRight,                                  // new
        //   // Add one stop for each color.
        //   // Stops should increase
        //   // from 0 to 1
        //   stops: [0.0, 1.0],
        //   colors: [
        //     // Colors are easy thanks to Flutter's
        //     // Colors class.
        //     // Color.fromRGBO(144, 247, 236, 1.0),
        //     // Color.fromRGBO(50, 204, 188, 1.0)
        //     Color.fromRGBO(206, 159, 252, 1.0),
        //     Color.fromRGBO(115, 103, 240, 1.0)
        //   ],
        // ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromRGBO(206, 159, 252, 1.0),
        //     offset: Offset.zero,
        //     blurRadius: 10.0,
        //   )
        // ],
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Hello!",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
                
              ),  
            ),
            Text(
              "You have 1 new event",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[900],
              ),  
            ),
          ],
        ),
        
      ),
    );
  }
}