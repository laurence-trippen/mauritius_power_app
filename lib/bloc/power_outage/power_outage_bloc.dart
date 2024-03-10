import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritius_power_app/models/power_outage_model.dart';
import 'package:mauritius_power_app/repositories/power_outage_repository.dart';

part 'power_outage_event.dart';
part 'power_outage_state.dart';

class PowerOutageBloc extends Bloc<PowerOutageEvent, PowerOutageState> {
  final PowerOutageRepository powerOutageRepository;

  PowerOutageBloc({required this.powerOutageRepository})
      : super(const PowerOutageState()) {
    on<PowerOutageFetched>(_handleFetched);
  }

  _handleFetched(PowerOutageFetched event, Emitter<PowerOutageState> emit) {
    print("Handle Fetched $event");
  }
}
