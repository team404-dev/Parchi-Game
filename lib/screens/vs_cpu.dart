import 'package:flutter/material.dart';
import 'package:parchi_lub/screens/game_board.dart';
import 'package:parchi_lub/services/game_space.dart';
import 'package:parchi_lub/utils/important_strings.dart';
import 'package:provider/provider.dart';

class VsCpuGame extends StatefulWidget {
  @override
  _VsCpuGameState createState() => _VsCpuGameState();
}

class _VsCpuGameState extends State<VsCpuGame> {

  final GameSpace gameSpace = GameSpace('cpu01', GAME_TYPE_CPU);
  @override
  Widget build(BuildContext context) {
    return GameBoard(gameSpace: gameSpace);
  }
}
