import 'dart:async';
import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutterpoker/config/Config.dart';
import 'package:flutterpoker/managers/session-manager.dart';
import 'package:flutterpoker/widgets/card_with_name.dart';
import 'package:flutterpoker/widgets/online_players.dart';
import 'package:flutterpoker/widgets/player_cards.dart';
import 'package:http/http.dart' as http;

class RoomScreen extends StatefulWidget {
  int roomId;

  RoomScreen({Key key, this.roomId}) : super(key: key);

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  Timer timer;
  var cardKey = GlobalKey<FlipCardState>();
  List<String> playerNames = [];
  List<Map<String, dynamic>> hiddenCards = [];
  bool hasEveryoneVoted = false;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => getRoomStatus());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            ListView(
              children: [
                OnlinePlayersWidget(players: this.playerNames),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 200),
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: generateHiddenCards(),
                    ),
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: PlayerCards(onCardPressed)
            )
          ]
      ),
    );
  }

  onCardPressed(int number) async {
    print("CARD PRESSED: $number");

    var sessionManager = SessionManager();
    var token = await sessionManager.getToken();

    var response = await http.post(
      '${Config.backendUrl}/room/vote',
      body: jsonEncode(<String, dynamic>{
        'token': token,
        'roomId': this.widget.roomId,
        'vote': number,
      }),
    );

    var voteFound = false;
    for (var hiddenCard in this.hiddenCards) {
      if (hiddenCard['token'] == token) {
        voteFound = true;
      }
    }

    if (!voteFound) {
      setState(() {
        hiddenCards.add({ 
          'token': token, 
          'name': 'Z', 
          'vote': null 
        });
      });
    }

    if (response.statusCode == 200) {
      print("VOTED");
    }
  }

  void getRoomStatus() async {
    var sessionManager = SessionManager();
    var token = await sessionManager.getToken();

    var response = await http.post(
      '${Config.backendUrl}/room/status',
      body: jsonEncode(<String, dynamic>{
        'token': token,
        'roomId': this.widget.roomId,
      }),
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var _playerNames = List<String>();
      var _hiddenCards = List<Map<String, dynamic>>();
      var _hasEveryoneVoted = json['room']['everyoneVoted'];

      for (var player in json['players']) {
        _playerNames.add(player['name']);

        if (player['hasVoted']) {
          _hiddenCards.add({ 
            'token': player['token'], 
            'name': player['name'], 
            'vote': player['vote'] 
          });
        }
      }

      setState(() {
        playerNames = _playerNames;
        hiddenCards = _hiddenCards;

        if (_hasEveryoneVoted) {
          // cardKey.currentState.toggleCard();
        }
        // hasEveryoneVoted = _hasEveryoneVoted;
      });
    }
  }

  List<Widget> generateHiddenCards() {
    List listings = new List<Widget>();
    for (var card in this.hiddenCards) {
      listings.add(
        CardWithNameWidget(
          name: card['name'], 
          number: card['vote'], 
          showValue: hasEveryoneVoted,
          // cardKey: cardKey,
        )
      );
    }
    return listings;
  }
}
