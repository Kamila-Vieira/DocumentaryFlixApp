import 'package:flutter/material.dart';

enum NotificationType { success, error, info, warning }

class SnackBarNotification {
  static success(BuildContext context, String message) =>
      _showNotification(context, NotificationType.success, message);
  static error(BuildContext context, String message) =>
      _showNotification(context, NotificationType.error, message);
  static info(BuildContext context, String message) =>
      _showNotification(context, NotificationType.info, message);
  static warning(BuildContext context, String message) =>
      _showNotification(context, NotificationType.warning, message);

  static void _showNotification(
    BuildContext context,
    NotificationType type,
    String message,
  ) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16.0,
            ),
          ),
          backgroundColor: (switch (type) {
            NotificationType.success => Colors.greenAccent,
            NotificationType.error => Colors.redAccent,
            NotificationType.warning => Colors.amberAccent,
            NotificationType.info => Colors.blueAccent,
          }),
          behavior: SnackBarBehavior.floating,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
      );
}