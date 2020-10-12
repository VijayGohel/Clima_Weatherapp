import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    void getLocation() async {
      Location location = Location();
      await location.getCurrentLocation();
      print(location.latitude);
      print(location.longitude);
    }

    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
