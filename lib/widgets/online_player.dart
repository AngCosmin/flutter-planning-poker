import 'package:flutter/material.dart';

class OnlinePlayerWidget extends StatefulWidget {
  @override
  _OnlinePlayerWidgetState createState() => _OnlinePlayerWidgetState();
}

class _OnlinePlayerWidgetState extends State<OnlinePlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.grey,
            ),
          ),
          Text(
            "Tom",
            style: TextStyle(
//              color: Colors.green
            ),
          )
        ],
      ),
    );
  }
}
