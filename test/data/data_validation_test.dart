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

    final Map<dynamic, dynamic> decodedJson = json.decode(response.body);

    // Check top-level object keys
    bool checkAllKeysAreStrings(Map<dynamic, dynamic> root) {
      for (final key in root.keys) {
        final bool keyIsValid = key is String && key.isNotEmpty;

        if (!keyIsValid) {
          print("Found invalid key: $key");
          return false;
        } else {
          print("Key is ok: $key");
        }
      }

      return true;
    }

    final bool allTopLevelKeysAreStrings = checkAllKeysAreStrings(decodedJson);

    // Check district array of objects
    bool validateRecordKeys(Map<dynamic, dynamic> json) {
      for (final key in json.keys) {
        if (key is String == false) {
          print("Found invalid key (not a string): $key");
          return false;
        }

        switch (key as String) {
          case "date":
          case "locality":
          case "streets":
          case "district":
          case "from":
          case "to":
          case "id":
            print("Valid record key: $key");
          default:
            print("Found invalid key: $key");
            return false;
        }
      }

      return true;
    }

    bool validateRecordValues(Map<dynamic, dynamic> json) {
      for (final entry in json.entries) {
        if (entry.value is String == false) {
          print("Found invalid value (not a string): ${entry.value}");
          return false;
        }

        switch (entry.key as String) {
          case "date":
          case "locality":
          case "streets":
          case "district":
          case "id":
            {
              if ((entry.value as String).isEmpty) {
                print("Found empty value: ${entry.key} => ${entry.value}");
                return false;
              }
            }
          case "from":
          case "to":
            {
              try {
                DateTime.tryParse(entry.value as String);
              } catch (e) {
                print(
                    "Found invalid date format: ${entry.key} => ${entry.value}");
                return false;
              }
            }
          default:
            print("Found invalid key: ${entry.key}");
            return false;
        }
      }

      return true;
    }

    final Map<dynamic, dynamic> testRecord = json.decode("""
    {
      "date": "Le mercredi 16 mars 2022 de  12:30:00 à  14:30:00",
      "locality": "FLIC-EN-FLAC",
      "streets": "MORC BISMIC",
      "district": "blackriver",
      "from": "2022-03-16T08:30:00.000Z",
      "to": "2022-03-16T10:30:00.000Z",
      "id": "f305aef9622b04c6b8aad5ffa847215e"
    }
    """);

    bool areRecordKeysValid = validateRecordKeys(testRecord);
    bool areRecordValuesValid = validateRecordValues(testRecord);

    // ASSERT
    expect(allTopLevelKeysAreStrings, equals(true));
    expect(areRecordKeysValid, equals(true));
    expect(areRecordValuesValid, equals(true));
  });
}
