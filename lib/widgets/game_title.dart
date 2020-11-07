import 'package:flutter/material.dart';

class GameTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      alignment: Alignment.center,
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: Color.fromRGBO(137, 44, 220, 0.4),
              radius: 30,
              child: FlutterLogo(
                size: 40,
              )),
          Text('The Parchi Game',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 24,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
