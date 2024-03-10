part of 'power_outage_bloc.dart';

sealed class PowerOutageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PowerOutageFetched extends PowerOutageEvent {}
