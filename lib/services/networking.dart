import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.url});
  final String url;

  Future getResponse() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);

      return decodedData;
    } else
      print(response.statusCode);
  }
}
