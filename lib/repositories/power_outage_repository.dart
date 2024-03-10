import 'package:mauritius_power_app/api/http_power_outage_api.dart';
import 'package:mauritius_power_app/api/offline_power_outage_api.dart';
import 'package:mauritius_power_app/http/app_http_client.dart';

class PowerOutageRepository {
  final HttpPowerOutageAPI _httpPowerOutageAPI;
  final OfflinePowerOutageAPI _offlinePowerOutageAPI;

  PowerOutageRepository(AppHttpClient httpClient)
      : _offlinePowerOutageAPI = const OfflinePowerOutageAPI(),
        _httpPowerOutageAPI = HttpPowerOutageAPI(httpClient);
}
