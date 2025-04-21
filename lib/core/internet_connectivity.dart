import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> hasInternetConnection() async {
  return InternetConnectionChecker.instance.hasConnection;
}
