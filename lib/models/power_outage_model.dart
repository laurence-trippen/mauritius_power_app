import 'package:mauritius_power_app/models/district.dart';

class PowerOutageModel {
  final String id;
  final DateTime date;
  final String locality;
  final String streets;
  final District district;
  final DateTime from;
  final DateTime to;

  const PowerOutageModel({
    required this.id,
    required this.date,
    required this.locality,
    required this.streets,
    required this.district,
    required this.from,
    required this.to,
  });

  factory PowerOutageModel.fromJson(Map<String, dynamic> json) {
    return PowerOutageModel(
      id: json['id'],
      date: json['date'],
      locality: json['locality'],
      streets: json['streets'],
      district: getDistrictByString(json['district']),
      from: DateTime.parse(json['from']),
      to: DateTime.parse(json['to']),
    );
  }
}
