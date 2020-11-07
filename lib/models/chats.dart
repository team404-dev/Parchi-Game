import 'package:flutter/cupertino.dart';

class Chat {

  String _playerName, _messageText;
  Chat(this._playerName, this._messageText);

  get messageText => _messageText;
  String get playerName => _playerName;

}