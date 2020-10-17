import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String appiKey = '9ad92fe0aa71d0aa442d8327623b2ecb';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude, longitude;

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper network = new NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$appiKey');
    var decodedData = await network.getResponse();
    var weatherId = decodedData['weather'][0]['id'];

    var temp = decodedData['main']['temp'];

    var nameCity = decodedData['name'];
    print('$weatherId $temp  $nameCity');
    // print('$latitude  $longitude');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
