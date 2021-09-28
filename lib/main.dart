import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_push/green_page.dart';
import 'package:firebase_push/red_page.dart';
import 'package:firebase_push/services/local_notification_service.dart';
import 'package:flutter/material.dart';

// App is in the background and terminated
Future<void> bgHandler(RemoteMessage message) async {
  print("Terminated");
  print(message.data.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
  // App is in the background and terminated
  FirebaseMessaging.onBackgroundMessage(bgHandler);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // I should always add this?
    // Whenever this function does return something, has pressed the notif
    // When the app was terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("It was terminated");
      print(message);
    });

    // Foreground!
    FirebaseMessaging.onMessage.listen((message) {
      print("Foreground");
      print(message.notification!.body);
      print(message.notification!.title);

      LocalNotificationService.display(message);
    });

    // App is in background but NOT TERMINATED and user taps on the notif
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("Not terminated");
      print(message.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Home hola'),
          ),
        ),
      ),
      routes: {
        "red": (_) => RedPage(),
        "green": (_) => GreenPage(),
      },
    );
  }
}
