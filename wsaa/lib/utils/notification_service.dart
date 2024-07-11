import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void init() {
    _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received message: ${message.notification?.title ?? ''} - ${message.notification?.body ?? ''}');
    });
  }

  void sendSOSNotification(String message, List<String> tokens) {
    for (var token in tokens) {
      _firebaseMessaging.sendMessage(
        to: token,
        data: {'message': message},
      );
    }
  }
}
