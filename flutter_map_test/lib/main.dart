import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(51.5, -0.09),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={pk.eyJ1IjoiZGVjb2RleiIsImEiOiJjam1hOWVqb3oybzF1M3FtdWN4Nm00dG93In0.PXwoXi3FJEeQK3jtvc755w}",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoiZGVjb2RleiIsImEiOiJjam1hOWVqb3oybzF1M3FtdWN4Nm00dG93In0.PXwoXi3FJEeQK3jtvc755w',
            'id': 'mapbox.streets',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: new LatLng(51.5, -0.09),
              builder: (ctx) =>
              new Container(
                child: new FlutterLogo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
