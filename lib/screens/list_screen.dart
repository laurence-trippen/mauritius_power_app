import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritius_power_app/bloc/power_outage/power_outage_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PowerOutageBloc, PowerOutageState>(
      builder: (context, state) {
        if (state.status == PowerOutageStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Container();
      },
    );
  }
}
