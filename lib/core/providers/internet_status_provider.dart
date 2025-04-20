import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetStatusProvider extends ChangeNotifier {
  bool _hasConnection = true;
  late StreamSubscription<InternetConnectionStatus> _subscription;

  bool get hasConnection => _hasConnection;

  InternetStatusProvider() {
    _subscription =
        InternetConnectionChecker.instance.onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus.connected;
      if (_hasConnection != connected) {
        _hasConnection = connected;
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
