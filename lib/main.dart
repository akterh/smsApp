import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sms_maintained/sms.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {







  void _smsSend(address,message2 ){
    SmsSender sender = SmsSender();
    SmsMessage message = SmsMessage(address, message2);
    message.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(message);
  }


  @override
  Widget build(BuildContext context) {


    Timer.periodic(Duration(seconds: 10), (Timer t) {

      _smsSend("01870204610","hey bro this message is sent from my flutter app automatically!!" );


    });


    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Runnng App....",style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold,color: Colors.cyan
        ),),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );


  }
}
