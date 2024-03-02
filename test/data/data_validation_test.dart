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

  test("dataset must be a decodable JSON-Format", () async {
    // ARRANGE
    final testUri = Uri.https(
      "raw.githubusercontent.com",
      "MrSunshyne/mauritius-dataset-electricity/main/data/power-outages.json",
    );

    // ACT
    final response = await http.get(testUri);

    bool isJsonDecodable = true;
    try {
      json.decode(response.body);
    } catch (e) {
      isJsonDecodable = false;
    }

    // ASSERT
    expect(() => json.decode("invalidJson{}:asdasd23!#"), throwsException);
    expect(() => json.decode(response.body), returnsNormally);
    expect(isJsonDecodable, equals(true));
  });

  test("dataset top-level should be all strings", () async {
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

    // ASSERT
    expect(allTopLevelKeysAreStrings, equals(true));
  });

  test("all dataset records should be in shape", () async {
    // ARRANGE
    final testUri = Uri.https(
      "raw.githubusercontent.com",
      "MrSunshyne/mauritius-dataset-electricity/main/data/power-outages.json",
    );

    // ACT
    final response = await http.get(testUri);

    final Map<dynamic, dynamic> decodedJson = json.decode(response.body);

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
            continue;
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
          case "streets":
            continue;
          case "date":
          case "locality":
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
                  "Found invalid date format: ${entry.key} => ${entry.value}",
                );

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

    void validateAllRecords(Iterable<dynamic> values) {
      int recordCounter = 0;

      for (final recordList in values) {
        for (final Map<dynamic, dynamic> record in recordList) {
          recordCounter++;

          final areRecordKeysValid = validateRecordKeys(record);
          final areRecordValuesValid = validateRecordValues(record);

          if (areRecordKeysValid == false || areRecordValuesValid == false) {
            print("Checked $recordCounter records");
            throw "Found invalid record: ${record.toString()}";
          }
        }
      }

      print("Checked successfuly $recordCounter records");
    }

    // // ASSERT
    expect(() => validateAllRecords(decodedJson.values), returnsNormally);
  });
}
