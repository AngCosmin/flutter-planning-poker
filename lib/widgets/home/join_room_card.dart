import 'package:flip_card/flip_card.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterpoker/extensions/hover_extensions.dart';
import 'package:flutterpoker/managers/socket-manager.dart';
import 'package:flutterpoker/routing/routes.dart';

class JoinRoomCard extends StatefulWidget {
  GlobalKey<FlipCardState> cardKey;

  JoinRoomCard({Key key, this.cardKey}) : super(key: key);

  @override
  _JoinRoomCardState createState() => _JoinRoomCardState();
}

class _JoinRoomCardState extends State<JoinRoomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.12),
                blurRadius: 3,
                spreadRadius: 1)
          ]),
      width: 275,
      height: 350,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your name'),
              SizedBox(height: 10),
              TextField(
                textAlign: TextAlign.center,
                enableSuggestions: false,
                decoration: InputDecoration(
                    hintText: 'Joe',
                    contentPadding: EdgeInsets.all(5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 10),
              Text('Room number'),
              SizedBox(height: 10),
              TextField(
                textAlign: TextAlign.center,
                enableSuggestions: false,
                decoration: InputDecoration(
                    hintText: '12345',
                    contentPadding: EdgeInsets.all(5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 10),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: Colors.blue)),
                onPressed: () => {
                  SocketManager.post('/user/info', { 'test': 'da' })
                  // FluroRouter.router.navigateTo(context, '/room')
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("JOIN", style: TextStyle(fontSize: 14)),
              ).showCursorOnHover,
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: FlatButton(
            hoverColor: Colors.transparent,
            onPressed: () => this.widget.cardKey.currentState.toggleCard(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Text(
              'Create room',
              style: TextStyle(color: Colors.blue),
            )
          ).showCursorOnHover,
        )
      ]),
    );
  }
}