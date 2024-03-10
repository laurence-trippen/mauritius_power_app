import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mauritius_power_app/http/app_http_client.dart';
import 'package:mauritius_power_app/mauritius_power_app.dart';
import 'package:mauritius_power_app/repositories/power_outage_repository.dart';

void main() {
  // TODO: Add only if main needs asnyc/await
  // WidgetsFlutterBinding.ensureInitialized();

  // TODO: FlutterError.onError

  final AppHttpClient httpClient =
      AppHttpClient(defaultBaseUrl: "raw.githubusercontent.com");

  // Zone to prevent crashes though uncaught errors.
  runZonedGuarded(
    () => runApp(MauritiusPowerApp(
      powerOutageRepository: PowerOutageRepository(httpClient),
    )),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
