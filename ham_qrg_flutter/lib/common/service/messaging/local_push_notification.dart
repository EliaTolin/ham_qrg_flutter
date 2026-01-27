import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hamqrg/common/service/messaging/model/received_notification/received_notification.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalPushNotification {
  LocalPushNotification(this._localNotificationsPlugin) {
    // init();
  }
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin;
  late AndroidNotificationChannel _androidChannel;
  Function(Map<String, dynamic>)? _handler;

  Future<void> init() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_stat_ic_notification'),
      iOS: DarwinInitializationSettings(requestAlertPermission: false),
    );

    _androidChannel = _notificationChannelAndroid();

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        if (details.payload != null) {
          final Map<String, dynamic> data = jsonDecode(details.payload!);
          _handler?.call(data);
        }
      },
    );
  }

  Future<void> scheduleNotification(
    ReceivedNotification receivedNotification,
    DateTime scheduledTime,
  ) async {
    await _localNotificationsPlugin.zonedSchedule(
      receivedNotification.id,
      receivedNotification.title,
      receivedNotification.body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      NotificationDetails(
        android: _androidNotificationDetails(),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: receivedNotification.payload,
      //uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  AndroidNotificationChannel _notificationChannelAndroid() {
    const channel = AndroidNotificationChannel(
      'firebase_local_notification',
      'HamQRG Notifications',
      description: 'Your HamQRG Notifications',
      importance: Importance.max,
    );
    return channel;
  }

  Future<void> showNotification(
    ReceivedNotification receivedNotification,
  ) async {
    await _localNotificationsPlugin.show(
      receivedNotification.id,
      receivedNotification.title,
      receivedNotification.body,
      NotificationDetails(
        android: _androidNotificationDetails(),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: receivedNotification.payload,
    );
  }

  AndroidNotificationDetails _androidNotificationDetails() {
    return AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      importance: Importance.max,
      priority: Priority.max,
    );
  }
}
