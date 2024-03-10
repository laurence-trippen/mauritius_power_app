part of 'power_outage_bloc.dart';

enum PowerOutageStatus {
  loading,
  success,
  failure,
}

final class PowerOutageState extends Equatable {
  final PowerOutageStatus status;
  final List<PowerOutageModel> outages;

  const PowerOutageState({
    this.status = PowerOutageStatus.loading,
    this.outages = const <PowerOutageModel>[],
  });

  PowerOutageState copyWith({
    PowerOutageStatus? status,
    List<PowerOutageModel>? outages,
  }) {
    return PowerOutageState(
      status: status ?? this.status,
      outages: outages ?? this.outages,
    );
  }

  @override
  List<Object> get props => [status, outages];
}
