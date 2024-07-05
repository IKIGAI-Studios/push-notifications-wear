import 'package:flutter/material.dart';
import 'package:push_notifications_wear/widgets/notification_icon_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NotificationIconWidget(
              initialNotificationState: false,
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
      ),
    );
  }
}
