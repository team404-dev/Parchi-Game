import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:parchi_lub/models/chats.dart';
import 'package:parchi_lub/models/game_player.dart';
import 'package:parchi_lub/utils/important_strings.dart';

class GameSpace{

  String _roomId, _gameType;
  List<GamePlayer> _gamePlayers;
  List<Chat> _chatList;
  Map<String, Map<String, int>> _scoreBoard;
  int _currentRound;

  GameSpace(String roomId, String gameType) {

    _roomId = roomId;
    _gameType = gameType;
    _chatList = List();
    _currentRound = 1;
    _gamePlayers = List();
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
    createGameSpace();

  }

  void _loadGameSpace(String roomId) async{

  }

  void createGameSpace() {

    List<int> playerTypesAvailable = [
      PLAYER_TYPE_RAJA, PLAYER_TYPE_MANTRI, PLAYER_TYPE_CHOR, PLAYER_TYPE_SIPAHI
    ];
    int availableIndex = 4;
    var random = new Random();
    for(int i=0; i<4; i++) {
      int assignedIndex = random.nextInt(1000)%availableIndex;
      _gamePlayers[i].playerType = playerTypesAvailable[assignedIndex];
      int temp = playerTypesAvailable[assignedIndex];
      playerTypesAvailable[assignedIndex] = playerTypesAvailable[availableIndex-1];
      playerTypesAvailable[availableIndex-1] = temp;
      availableIndex--;
    }

  }

  void updateScores(int winStatus) {
    //Map<String, int> _roundScore = Ma;
    for(int i=0; i<4; i++) {
      switch(_gamePlayers[i].playerType) {
        case PLAYER_TYPE_RAJA:
          _gamePlayers[i].playerScore += SCORE_RAJA;
          break;
        case PLAYER_TYPE_MANTRI:
          (winStatus == STATUS_WIN) ?_gamePlayers[i].playerScore += SCORE_MANTRI_WIN :_gamePlayers[i].playerScore += SCORE_MANTRI_LOSE;
          break;
        case PLAYER_TYPE_CHOR:
          (winStatus == STATUS_WIN) ?_gamePlayers[i].playerScore += SCORE_CHOR_WIN :_gamePlayers[i].playerScore += SCORE_CHOR_LOSE;
          break;
        case PLAYER_TYPE_SIPAHI:
          _gamePlayers[i].playerScore += SCORE_SIPAHI;
          break;
      }
      //_roundScore[_gamePlayers[0].playerName] = _gamePlayers[i].playerScore;
    }
    //_scoreBoard['Round $_currentRound'] = _roundScore;
    _currentRound++;
  }

  Map<String, Map<String, int>> get scoreBoard => _scoreBoard;

  List<GamePlayer> get gamePlayers => _gamePlayers;

  int get currentRound => _currentRound;

  List<Chat> get chatList => _chatList;

  String get gameType => _gameType;

  String get roomId => _roomId;

}