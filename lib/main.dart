import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpoker/managers/socket-manager.dart';
import 'package:flutterpoker/routing/routes.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'managers/session-manager.dart';

void main() async {
  var sessionManager = SessionManager();

  sessionManager.getToken().then((value) {
    if (value == null) {
      var token = randomAlphaNumeric(20);
      sessionManager.setToken(token);  
      SocketManager.start(headers: { 'token': token });
    } else {
      SocketManager.start(headers: { 'token': value });
    }
  });
  
  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: FluroRouter.router.generator,
    );
  }
}