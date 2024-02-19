import 'package:classic_eccomerce/notifications/data/models/notification.dart';
import 'package:classic_eccomerce/notifications/presentation/cubit/notifications_states.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit() : super(NotificationsInitialState());

  static NotificationsCubit get(context) => BlocProvider.of(context);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin? fltNotification;

  List<Notification> notifications = [];

  init() async {
    FirebaseMessaging.instance.requestPermission();
    await FirebaseMessaging.instance.subscribeToTopic('all');
    //messaging.getToken().then((value) => print("Device token: $value"));
    listenToFirebaseFCM();
  }

  listenToFirebaseFCM() {
    var androiInit = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosInit = const DarwinInitializationSettings();
    var initSetting = InitializationSettings(android: androiInit, iOS: iosInit);
    fltNotification = FlutterLocalNotificationsPlugin();
    fltNotification?.initialize(initSetting);
    var androidDetails = const AndroidNotificationDetails(
      "1",
      "channelName",
    );
    var iosDetails = const DarwinNotificationDetails();
    var generalNotificationDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        fltNotification?.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails);
        var dateTimeNow = DateTime.now();
        String dateTimeNowFormattedString =
            "${dateTimeNow.year}/${dateTimeNow.month}/${dateTimeNow.day} ${dateTimeNow.hour}:${dateTimeNow.minute}";
        notifications.add(Notification(
            title: notification.title,
            body: notification.body,
            date: dateTimeNowFormattedString));
        emit(NotificationsReceivedState());
      }
    });
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
    //   String? title = remoteMessage.notification?.title;
    //   String? description = remoteMessage.notification?.body;
    //   print(title);
    //   print(description);
    // });
  }
}
