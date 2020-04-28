import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterpoker/screens/home.dart';
import 'package:flutterpoker/screens/room.dart';

class FluroRouter {
  static Router router = Router();

  static Handler _homehandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomeScreen()
  );

  static Handler _roomhandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) => RoomScreen()
  );

  static void setupRouter() {
    router.define('/', handler: _homehandler,);
    router.define('/room', handler: _roomhandler,);
  }
}
