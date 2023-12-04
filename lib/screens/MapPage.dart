
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  const GMap({super.key});

  @override
  State<GMap> createState() => _GMapState();
}

class _GMapState extends State<GMap> {
    static const LatLng _gloc = LatLng(32.219429, 76.323199);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GoogleMap(initialCameraPosition: CameraPosition(target: _gloc , zoom: 12) ,)
    );
  }
}
