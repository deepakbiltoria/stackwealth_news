// import 'dart:async';
// import 'dart:developer';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:stackwealth_news/core/utils/app_utils.dart';
//
// class ConnectionManagerController extends GetxController {
//   //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
//   var connectionType = 1.obs;
//
//   final Connectivity connectivity = Connectivity();
//
//   late StreamSubscription _streamSubscription;
//
//   @override
//   void onInit() {
//     super.onInit();
//     // getConnectivityType();
//     log("init");
//
//     _streamSubscription = connectivity.onConnectivityChanged.listen(
//       _updateState,
//     );
//     _streamSubscription.resume();
//     log("message ${_streamSubscription}");
//   }
//
//   Future<void> getConnectivityType() async {
//     late ConnectivityResult connectivityResult;
//     try {
//       connectivityResult = await (connectivity.checkConnectivity());
//     } on PlatformException catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     return _updateState(connectivityResult);
//   }
//
//   _updateState(ConnectivityResult result) {
//     log("result _updateState ${result}");
//     switch (result) {
//       case ConnectivityResult.wifi:
//         // if (connectionType.value == 0) {
//         //   Get.offAndToNamed(
//         //       Get.previousRoute == "null"
//         //           ? AppRoutes.splashScreen
//         //           : Get.previousRoute,
//         //       arguments: Get.arguments);
//         // }
//         connectionType.value = 1;
//         break;
//       case ConnectivityResult.mobile:
//         // if (connectionType.value == 0) {
//         //   Get.offAndToNamed(
//         //       Get.previousRoute == "null"
//         //           ? AppRoutes.splashScreen
//         //           : Get.previousRoute,
//         //       arguments: Get.arguments);
//         // }
//         connectionType.value = 2;
//
//         break;
//       case ConnectivityResult.none:
//         connectionType.value = 0;
//
//         //     Get.offNamed(AppRoutes.nointernet, arguments: Get.arguments);
//         break;
//       default:
//         showToastMessage('Error', 'Failed to get connection type');
//         break;
//     }
//   }
//
//   @override
//   void onClose() {
//     _streamSubscription.cancel();
//   }
// }
