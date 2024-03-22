// ignore_for_file: file_names

import 'dart:async';
import 'package:connectivity/connectivity.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

class GlobalFunctions {
  Future<bool> isConnected() async {
    bool data = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.none:
        data = false;
        break;
      case ConnectivityResult.mobile:
        data = true;
        break;
      case ConnectivityResult.wifi:
        data = true;
        break;
      default:
        data = false;
    }
    return data;
  }
}

final globalFunctions = GlobalFunctions();
