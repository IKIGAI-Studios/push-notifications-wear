import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";
import "package:push_notifications_wear/widgets/notification_icon_widget.dart";

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get notification message and show
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    String? notificationBody = message.notification?.body;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NotificationIconWidget(
            initialNotificationState:
                notificationBody!.toUpperCase().contains("ON"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              "Led Notifications",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
