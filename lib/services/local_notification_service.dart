// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        print("Tap on foreground");
        print(payload);
      },
    );
  }

  static void display(RemoteMessage message) async {
    try {
      print("Ando en display");
      print(message.toString());
      final id = Random().nextInt(10000) + 1;

      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "evelyn_chichis",
          "evelyn_chichis_channel",
          "I want to bury my face on them",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationsPlugin.show(id, message.notification!.title,
          message.notification!.title, notificationDetails,
          payload: message.data["message"]);
    } on Exception catch (e) {
      print(e);
      print("Exception");
    }
  }
}
