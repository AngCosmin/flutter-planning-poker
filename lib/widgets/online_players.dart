import 'package:flutter/material.dart';
import 'package:flutterpoker/widgets/online_player.dart';
import 'package:flutterpoker/widgets/player_card.dart';

class OnlinePlayersWidget extends StatefulWidget {
  var players = List<String>();

  OnlinePlayersWidget({Key key, this.players}) : super(key: key);

  @override
  _OnlinePlayersWidgetState createState() => _OnlinePlayersWidgetState();
}

class _OnlinePlayersWidgetState extends State<OnlinePlayersWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
//            bottomLeft: Radius.circular(20),
//            bottomRight: Radius.circular(20)
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12),
              blurRadius: 3,
              spreadRadius: 1
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: this._getListings(),
        ),
      ),
    );
  }

  List<Widget> _getListings() { // <<<<< Note this change for the return type
    List listings = new List<Widget>();
    for (var player in this.widget.players) {
      listings.add(OnlinePlayerWidget(name: player));
    }
    return listings;
  }
}
