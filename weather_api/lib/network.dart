// ignore_for_file: empty_constructor_bodies, avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  String url;

  NetworkHelper({required this.url});

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('API Error code ${response.statusCode}');
    }
  }
}
