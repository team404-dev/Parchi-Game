import 'dart:math';

import 'package:parchi_lub/models/chats.dart';
import 'package:parchi_lub/models/game_player.dart';
import 'package:parchi_lub/utils/important_strings.dart';

class GameSpace {

  String _roomId, _gameType;
  List<GamePlayer> _gamePlayers;
  List<Chat> _chatList;
  Map<String, int> _scoreBoard;

  GameSpace(this._roomId, this._gameType) {

    _chatList = List();
    // Game against CPU
    if(_gameType == GAME_TYPE_CPU){
      GamePlayer gamePlayer = GamePlayer('Kartik', CPU_AVATAR);
      _gamePlayers.add(gamePlayer);
      gamePlayer = GamePlayer('CPU 1', CPU_AVATAR);
      _gamePlayers.add(gamePlayer);
      gamePlayer = GamePlayer('CPU 2', CPU_AVATAR);
      _gamePlayers.add(gamePlayer);
      gamePlayer = GamePlayer('CPU 3', CPU_AVATAR);
      _gamePlayers.add(gamePlayer);
    }
    // Online multiplayer game or create/join room
    else {
      _loadGameSpace(_roomId);
    }

  }

  Future _loadGameSpace(String roomId) {

  }

  void createGameSpace(List<GamePlayer> players) {
    List<int> playerTypesAvailable = [
      PLAYER_TYPE_RAJA, PLAYER_TYPE_MANTRI, PLAYER_TYPE_CHOR, PLAYER_TYPE_SIPAHI
    ];
    int availableIndex = 3;
    var random = new Random();
    for(int i=0; i<4; i++) {
      int assignedIndex = random.nextInt(availableIndex);
      players[i].playerType = playerTypesAvailable[assignedIndex];
      int temp = playerTypesAvailable[assignedIndex];
      playerTypesAvailable[assignedIndex] = playerTypesAvailable[availableIndex];
      playerTypesAvailable[availableIndex] = temp;
      availableIndex--;
    }
  }

}