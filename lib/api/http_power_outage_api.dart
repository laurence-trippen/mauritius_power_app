import 'package:mauritius_power_app/api/power_outage_api.dart';
import 'package:mauritius_power_app/models/power_outage_model.dart';
import 'package:http/http.dart' as http;

class HttpPowerOutageAPI implements IPowerOutageAPI {
  const HttpPowerOutageAPI(http.Client client);

  @override
  Future<List<PowerOutageModel>> getAllOutages() {
    // TODO: implement getAllOutages
    throw UnimplementedError();
  }

  @override
  Stream<List<PowerOutageModel>> getAllOutagesStream() {
    // TODO: implement getAllOutagesStream
    throw UnimplementedError();
  }

  @override
  Future<void> saveOutages(List<PowerOutageModel> outages) {
    // TODO: implement saveOutages
    throw UnimplementedError();
  }
}
