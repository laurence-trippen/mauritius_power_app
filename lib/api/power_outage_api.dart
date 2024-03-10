import 'package:mauritius_power_app/models/power_outage_model.dart';

abstract class IPowerOutageAPI {
  Future<List<PowerOutageModel>> getAllOutages();

  Stream<List<PowerOutageModel>> getAllOutagesStream();

  Future<void> saveOutages(List<PowerOutageModel> outages);
}
