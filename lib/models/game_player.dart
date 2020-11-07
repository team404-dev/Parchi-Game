class GamePlayer {

  String playerName;
  int _playerType;
  String playerAvatar;
  int _playerScore;

  GamePlayer(String name, String avatar) :
      this.playerName = name,
      this.playerAvatar = avatar,
      this._playerScore = 0;

  int get playerScore => _playerScore;

  set playerScore(int score) {
    _playerScore = score;
  }

  int get playerType => _playerType;

  set playerType(int type) {
    _playerType = type;
  }

}