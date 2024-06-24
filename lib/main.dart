import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter_firebase_notifications_tutorial/controllers/auth_service.dart';
import 'package:sample_flutter_firebase_notifications_tutorial/views/home_page.dart';
import 'package:sample_flutter_firebase_notifications_tutorial/views/login_page.dart';
import 'package:sample_flutter_firebase_notifications_tutorial/views/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controllers/notification_service.dart';
import 'firebase_options.dart';
import 'views/message.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final navigatorKey = GlobalKey<NavigatorState>();

// function to lisen to background changes
Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print('Some notification Received in Background');
  }
}

void main() async {
  await dotenv.load(fileName: "assets/.env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // initialize firebase messaging
  await PushNotifications.init();

  // initialize local notifications
  await PushNotifications.localNotiInit();

  // listen to background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

// on background notification tapped
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print('Background notification Tapped');
      navigatorKey.currentState!.pushNamed("/message", arguments: message);
    }
  });

  // to handle foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message){
    String payloadData = jsonEncode(message.data);
    print('Got a message in foreground');
    if (message.notification != null){
         PushNotifications.showSimpleNotification(
          title: message.notification!.title!, 
          body: message.notification!.body!, 
          payload: payloadData);
    }
  });

  final RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();

  if (message!=null){
     Future.delayed(Duration(seconds:1),(){
      navigatorKey.currentState!.pushNamed("/message",arguments:message);
     });
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Flutter Firebase Notifications',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      routes: {
        "/": (context) => CheckUser(),
        "/signup": (context) => SignUpPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/message": (context) => Message(),
      },
    );
  }
}

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  void initState() {
    AuthService.isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
