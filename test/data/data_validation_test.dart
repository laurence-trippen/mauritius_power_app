import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:json_schema/json_schema.dart';

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

    File schemaFile = File("assets/schemas/dataset.schema.json");
    final jsonSchemaString = await schemaFile.readAsString();

    final schema = JsonSchema.create(jsonSchemaString);
    final result = schema.validate(response.body);

    print(result.errors);
    print(result.warnings);

    // ASSERT
    expect(result.isValid, equals(true));
  });
}
