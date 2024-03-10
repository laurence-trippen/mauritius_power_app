import 'package:mauritius_power_app/api/power_outage_api.dart';
import 'package:mauritius_power_app/http/app_http_client.dart';
import 'package:mauritius_power_app/models/power_outage_model.dart';

class HttpPowerOutageAPI implements IPowerOutageAPI {
  static const String powerOutageEndpoint =
      "https://raw.githubusercontent.com/MrSunshyne/mauritius-dataset-electricity/main/data/power-outages.json";

  final AppHttpClient client;

  const HttpPowerOutageAPI(this.client);

  @override
  Future<List<PowerOutageModel>> getAllOutages() {
    // client.get(AppHttpRequest(url: "", customBaseUrl: ))

    throw UnimplementedError();
  }

  @override
  Stream<List<PowerOutageModel>> getAllOutagesStream() {
    // TODO: implement getAllOutagesStream
    throw UnimplementedError();
  }

  @override
  Future<void> saveOutages(List<PowerOutageModel> outages) {
    throw UnimplementedError(
        "saveOutages isn't supported for the read-only Http-API.");
  }
}
