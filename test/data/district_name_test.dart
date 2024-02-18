import 'package:flutter_test/flutter_test.dart';
import 'package:mauritius_power_app/models/district.dart';

void main() {
  test("district enum should know strings", () {
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
}
