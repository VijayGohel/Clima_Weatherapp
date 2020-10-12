import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocation();
    getResponse();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getResponse() async {
    http.Response response = await http.get('http://google.com/');
    if (response.statusCode == 200)
      print(response.body);
    else
      print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
