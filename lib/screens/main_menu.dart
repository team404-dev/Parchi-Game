import 'package:flutter/material.dart';
import 'package:parchi_lub/widgets/game_title.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GameTitle(),
                MenuButton(text: 'Online Multiplayer', onPressed: () {}),
                MenuButton(text: 'Vs CPU', onPressed: () {
                  Navigator.of(context).pushNamed('vsCpu');
                }),
                MenuButton(text: 'Create room', onPressed: () {}),
                MenuButton(text: 'Join room', onPressed: () {}),
                MenuButton(text: 'Instructions', onPressed: () {
                  Navigator.of(context).pushNamed('instructions');
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  MenuButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(
              letterSpacing: 1.5, fontSize: 18),
        ),
        onPressed: onPressed,
        color: Color.fromRGBO(137, 44, 220, 1),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
