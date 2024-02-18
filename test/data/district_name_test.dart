import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mauritius_power_app/models/district.dart';
import 'package:http/http.dart' as http;

void main() {
  test("getDistrictByString should return correct enum value", () {
    District blackriver = getDistrictByString('blackriver');
    District flacq = getDistrictByString('flacq');
    District grandport = getDistrictByString('grandport');
    District moka = getDistrictByString('moka');
    District pamplemousses = getDistrictByString('pamplemousses');
    District plainewilhems = getDistrictByString('plainewilhems');
    District portlouis = getDistrictByString('portlouis');
    District rivieredurempart = getDistrictByString('rivieredurempart');
    District savanne = getDistrictByString('savanne');
    District rodrigues = getDistrictByString('rodrigues');

    District unknown = getDistrictByString('unknwondistrictXYZ123');

    expect(blackriver, equals(District.blackriver));
    expect(flacq, equals(District.flacq));
    expect(grandport, equals(District.grandport));
    expect(moka, equals(District.moka));
    expect(pamplemousses, equals(District.pamplemousses));
    expect(plainewilhems, equals(District.plainewilhems));
    expect(portlouis, equals(District.portlouis));
    expect(rivieredurempart, equals(District.rivieredurempart));
    expect(savanne, equals(District.savanne));
    expect(rodrigues, equals(District.rodrigues));

    expect(unknown, equals(District.unknown));
  });

  test("district enum should know all districts", () async {
    // ARRANGE
    final testUri = Uri.https(
      "raw.githubusercontent.com",
      "MrSunshyne/mauritius-dataset-electricity/main/data/power-outages.json",
    );

    // ACT
    final response = await http.get(testUri);

    final Map<String, dynamic> decodedJson = json.decode(response.body);

    final List<String> decodedDistrictStrings = decodedJson.keys.toList();

    final districts = decodedDistrictStrings.map((districtName) {
      // ignore: avoid_print
      print("Found: $districtName");

      District district = getDistrictByString(districtName);

      if (district == District.unknown) {
        // ignore: avoid_print
        print("Found Unknown district: $districtName");
      }

      return district;
    }).toList();

    // ASSERT
    expect(false, districts.contains(District.unknown));
  });
}
