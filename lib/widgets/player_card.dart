import 'package:flutter/material.dart';
import 'package:parchi_lub/models/game_player.dart';
import 'package:parchi_lub/utils/important_strings.dart';

class PlayerCard extends StatelessWidget {

  final GamePlayer gamePlayer;
  final bool showAll;
  PlayerCard({@required this.gamePlayer, this.showAll=false});
  final cardColors = {
    PLAYER_TYPE_RAJA: Colors.pink,
    PLAYER_TYPE_MANTRI: Colors.greenAccent,
    PLAYER_TYPE_SIPAHI: Colors.transparent,
    PLAYER_TYPE_CHOR: Colors.transparent
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: cardColors[gamePlayer.playerType],
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Color.fromRGBO(137, 44, 220, 0.4),
              child: Image(image: AssetImage(gamePlayer.playerAvatar), fit: BoxFit.contain),
            ),
          ),
          Text(gamePlayer.playerName,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 1),
          ),
          Text((showAll || gamePlayer.playerType == PLAYER_TYPE_RAJA || gamePlayer.playerType == PLAYER_TYPE_MANTRI)
          ?'(${PLAYER_TYPE[gamePlayer.playerType]})' :'', style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
