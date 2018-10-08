import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './widgets/event_tile.dart';
import './widgets/topBar.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //appBar: new AppBar(title: new Text('IMIN')),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*(1/6),
            child: TopBar(),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*(5/6),
            child: StreamBuilder(
              stream: Firestore.instance.collection('events').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
                return new ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  padding: const EdgeInsets.only(top: 10.0),
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];
                    return EventTile(item: ds);
                  }
                );
              }),
          ),
        ],
      ),
      
    );
  }
}