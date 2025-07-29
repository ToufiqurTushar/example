import 'dart:convert';
import 'package:flutter_rapid/flutter_rapid.dart';

class AppPushNotifyCallback extends RapidPushNotifyCallback {
  @override
  void iOSNotificationReceived(RapidIosNotifyResponse response) {}

  @override
  void onSelectNotification(RapidNotifyResponse response) {
    if (response.payload != null && response.payload!.isNotEmpty) {
      var data = json.decode(response.payload ?? "{}");
    } else {}
  }
}