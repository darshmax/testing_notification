import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late FlutterLocalNotificationsPlugin fltrNotification;

  @override
  void initState(){
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(androidInitialize, iOSInitialize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initializationSettings);
  }

   Future<dynamic> _showNotification() async{
      var androidDetails = new AndroidNotificationDetails(
          "channelId",
          "channelName",
          "This is Notification",
          importance: Importance.High);
      var iosDetails = new IOSNotificationDetails();
      var generalNotificationDetails = new NotificationDetails(androidDetails, iosDetails);
      await fltrNotification.show(0, "Notify", "the body of the notification", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: _showNotification(),
          child: const Text('Notification'),
        ),
      ),
    );
  }
}
