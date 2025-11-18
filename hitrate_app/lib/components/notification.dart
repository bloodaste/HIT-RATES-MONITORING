// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   // Single instance of plugin
//   final FlutterLocalNotificationsPlugin notify =
//       FlutterLocalNotificationsPlugin();

//   bool _isInitialized = false;

//   bool get isInitialized => _isInitialized;

//   /// Initialize notifications
//   Future<void> initNotification() async {
//     if (_isInitialized) return;

//     // Use only the resource name, no @, no extension
//     const androidSettings = AndroidInitializationSettings('ic_launcher');

//     const settings = InitializationSettings(android: androidSettings);

//     await notify.initialize(settings);

//     _isInitialized = true;
//   }

//   /// Request notification permissions (Android 13+ and iOS)
//   Future<void> requestPermissions() async {
//     // Android 13+
//     await notify
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.requestExactAlarmsPermission();

//     // iOS
//     await notify
//         .resolvePlatformSpecificImplementation<
//             IOSFlutterLocalNotificationsPlugin>()
//         ?.requestPermissions(alert: true, badge: true, sound: true);
//   }

//   /// Notification details
//   NotificationDetails get notificationDetails {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channel_id',
//         'Notifications',
//         channelDescription: 'Daily notification',
//         importance: Importance.max,
//         priority: Priority.high,
//         icon: 'ic_launcher', // Must match a valid resource in mipmap/drawable
//       ),
//     );
//   }

//   /// Show a notification
//   Future<void> showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//   }) async {
//     // Ensure the plugin is initialized
//     if (!_isInitialized) await initNotification();

//     await notify.show(id, title, body, notificationDetails);
//   }
// }
