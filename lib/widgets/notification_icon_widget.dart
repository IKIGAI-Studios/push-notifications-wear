import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationIconWidget extends StatefulWidget {
  @override
  _NotificationIconWidgetState createState() => _NotificationIconWidgetState();
}

class _NotificationIconWidgetState extends State<NotificationIconWidget> {
  bool _notificationReceived = false;

  bool get notificationReceived => _notificationReceived;

  @override
  void initState() {
    super.initState();
    initPushNotifications();
  }

  Future<void> initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        // Acceder al texto de la notificación
        String? notificationBody = message.notification?.body;

        setState(() {
          _notificationReceived =
              notificationBody!.toUpperCase().contains("ON");
        });
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      // Acceder al texto de la notificación
      String? notificationBody = message.notification?.body;

      setState(() {
        // Verificar si la notificación contiene la palabra "ON"
        _notificationReceived = notificationBody!.toUpperCase().contains("ON");
      });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // Acceder al texto de la notificación
      String? notificationBody = message.notification?.body;

      setState(() {
        // Verificar si la notificación contiene la palabra "ON"
        _notificationReceived = notificationBody!.toUpperCase().contains("ON");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _notificationReceived ? Icons.lightbulb : Icons.lightbulb_outline,
      ),
      onPressed: () {
        // Aquí puedes definir lo que sucede cuando se toca el icono
      },
    );
  }
}
