import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutterpoker/widgets/home/create_room_card.dart';
import 'package:flutterpoker/widgets/home/join_room_card.dart';

class HomeScreen extends StatefulWidget {
  var cardKey = GlobalKey<FlipCardState>();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('resources/images/logo.png', height: 200),
          FlipCard(
            key: this.widget.cardKey,
            flipOnTouch: false,
            front: JoinRoomCard(cardKey: this.widget.cardKey), 
            back: CreateRoomCard(cardKey: this.widget.cardKey)
          )
        ],
      )),
    );
  }
}
