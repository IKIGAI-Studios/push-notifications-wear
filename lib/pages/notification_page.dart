import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get notification message and show
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message.notification!.title.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            message.notification!.body.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            message.data.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
