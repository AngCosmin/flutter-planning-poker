import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpoker/managers/socket-manager.dart';
import 'package:flutterpoker/routing/routes.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  var prefs = await SharedPreferences.getInstance();

  if (prefs.getString('token') == null) {
    await prefs.setString('token', randomAlphaNumeric(20));
  }

  SocketManager.start(headers: { 'token': prefs.getString('token') });
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