import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterpoker/extensions/hover_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

class CreateRoomCard extends StatefulWidget {
  GlobalKey<FlipCardState> cardKey;
  
  CreateRoomCard({Key key, this.cardKey}) : super(key: key);

  @override
  _CreateRoomCardState createState() => _CreateRoomCardState();
}

class _CreateRoomCardState extends State<CreateRoomCard> {
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
      height: 300,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Password'),
              SizedBox(height: 10),
              TextField(
                textAlign: TextAlign.center,
                enableSuggestions: false,
                decoration: InputDecoration(
                    hintText: '12345 or empty',
                    contentPadding: EdgeInsets.all(5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 10),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide(color: Colors.blue)),
                onPressed: () async {
                  var prefs = await SharedPreferences.getInstance();
                  await prefs.setString('cosmin', 'test');
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("CREATE", style: TextStyle(fontSize: 14)),
              ).showCursorOnHover,
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          child: FlatButton(
            hoverColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            onPressed: () => this.widget.cardKey.currentState.toggleCard(),
            child: Text(
              'Join room',
              style: TextStyle(color: Colors.blue),
            )
          ).showCursorOnHover,
        )
      ]),
    );
  }
}