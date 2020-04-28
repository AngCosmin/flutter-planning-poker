import 'package:flutter/material.dart';
import 'package:flutterpoker/widgets/card_with_name.dart';
import 'package:flutterpoker/widgets/online_players.dart';
import 'package:flutterpoker/widgets/player_cards.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            ListView(
              children: [
                OnlinePlayersWidget(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 200),
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CardWithNameWidget(number: 0),
                        CardWithNameWidget(number: 1),
                        CardWithNameWidget(number: 2),
                        CardWithNameWidget(number: 3),
                        CardWithNameWidget(number: 5),
                        CardWithNameWidget(number: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: PlayerCards()
            )
          ]
      ),
    );
  }
}
