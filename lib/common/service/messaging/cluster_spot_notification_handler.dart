import 'package:flutter/material.dart';
import 'package:hamqrg/router/app_router.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

/// Initializes OneSignal handlers for cluster spot push notifications.
/// Call this after OneSignal.initialize() and after the app router is available.
void setupClusterSpotNotificationHandlers(AppRouter router) {
  // Notification tapped (app in background or cold start)
  OneSignal.Notifications.addClickListener((event) {
    final data = event.notification.additionalData;
    if (data == null) return;
    if (data['type'] != 'new_cluster_spot') return;

    final repeaterId = data['repeater_id'] as String?;
    if (repeaterId == null) return;

    router.push(RepeaterDetailRoute(repeaterId: repeaterId));
  });

  // Notification received while app is in foreground
  OneSignal.Notifications.addForegroundWillDisplayListener((event) {
    final data = event.notification.additionalData;
    if (data == null) return;
    if (data['type'] != 'new_cluster_spot') return;

    final repeaterId = data['repeater_id'] as String?;
    if (repeaterId == null) return;

    // Check if user is already on the same repeater detail page
    final currentRoute = router.current;
    if (currentRoute.name == RepeaterDetailRoute.name) {
      final args = currentRoute.args;
      if (args is RepeaterDetailRouteArgs &&
          args.repeaterId == repeaterId) {
        // Suppress notification — Realtime already updates the page
        event.preventDefault();
        return;
      }
    }

    // Show in-app notification instead of OS notification
    event.preventDefault();

    final context = router.navigatorKey.currentContext;
    if (context == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          event.notification.body ?? event.notification.title ?? '',
        ),
        action: SnackBarAction(
          label: 'Apri',
          onPressed: () {
            router.push(RepeaterDetailRoute(repeaterId: repeaterId));
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  });
}
