import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test("dataset must be available", () async {
    // ARRANGE
    final testUri = Uri.https(
      "raw.githubusercontent.com",
      "MrSunshyne/mauritius-dataset-electricity/main/data/power-outages.json",
    );
    // ACT
    final response = await http.get(testUri);

    // ASSERT
    expect(
        response.statusCode,
        allOf([
          greaterThanOrEqualTo(200),
          lessThan(300),
        ]));
  });

  test("dataset should be in shape and parsable", () async {
    // ARRANGE
    final testUri = Uri.https(
      "raw.githubusercontent.com",
      "MrSunshyne/mauritius-dataset-electricity/main/data/power-outages.json",
    );

    // ACT
    final response = await http.get(testUri);

    final Map<String, dynamic> decodedJson = json.decode(response.body);

    decodedJson.keys.toList().forEach((element) {
      // ignore: avoid_print
      print(element);
    });

    // ASSERT
    expect(true, equals(true));
  });
}
