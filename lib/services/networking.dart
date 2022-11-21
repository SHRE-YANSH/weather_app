import 'package:requests/requests.dart';
import 'dart:convert';

class NetworkHelp {
  NetworkHelp(this.url);
  final String url;

  Future getData() async {
    var response = await Requests.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
