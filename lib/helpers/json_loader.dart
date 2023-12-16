import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonLoader {
  Future<Map<String, dynamic>> loadJsonData(String path) async {
    String jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString);
  }
}

// fetch data lokal json
Future<Map<String, dynamic>> loadLocalJson(String path) async {
  JsonLoader jsonLoader = JsonLoader();
  Map<String, dynamic> jsonData = await jsonLoader.loadJsonData(path);
  return jsonData;
}
