// To parse this JSON data, do
//
//     final categoryModels = categoryModelsFromJson(jsonString);

import 'dart:convert';

List<String> categoryModelsFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String categoryModelsToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
