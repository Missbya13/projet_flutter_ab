import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/meteo_model.dart';
import '../util/constants.dart';

Future<MeteoModel> getMeteo(int count) async {
  String city = villes[count];

  try {
    return await http
        .get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'))
        .then((value) {
      if (value.statusCode == 200) {
        return MeteoModel.fromJson(jsonDecode(value.body));
      } else {
        throw value.body;
      }
    }).catchError((error) {
      throw error;
    });
  } catch (e) {
    rethrow;
  }
}
