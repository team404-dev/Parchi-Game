import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parchi_lub/services/game_space.dart';
import 'package:parchi_lub/utils/important_strings.dart';
import 'package:parchi_lub/widgets/player_card.dart';
import 'package:provider/provider.dart';

class GameBoard extends StatefulWidget {

  final GameSpace gameSpace;
  GameBoard({@required this.gameSpace});

  @override
  _GameBoardState createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {

  var centerMessage;
  var _absorbing = true, _showScoreCard=false, _showAll=false;

  @override
  void initState() {
    centerMessage = 'You are chosen as \n${PLAYER_TYPE[widget.gameSpace.gamePlayers[0].playerType]}';
    Timer(Duration(seconds: 2), () {
      setState(() {
        centerMessage = 'Mantri.. Chor sipahi ka pta lgao!';
        if(widget.gameSpace.gamePlayers[0].playerType == PLAYER_TYPE_MANTRI)
          _absorbing = false;
        startGame();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.gameSpace.gameType}\nroomId: ${widget.gameSpace.roomId}',
          style: TextStyle(fontSize: 16), textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios, color: Colors.white), onTap: (){
          Navigator.of(context).pop();
        }),
      ),
      body: AbsorbPointer(
        absorbing: _absorbing,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () { makeChoice(0); },
                child: PlayerCard(gamePlayer: widget.gameSpace.gamePlayers[0], showAll: _showAll,),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: GestureDetector(
                onTap: () { makeChoice(1); },
                child: PlayerCard(gamePlayer: widget.gameSpace.gamePlayers[1], showAll: _showAll),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: GestureDetector(
                onTap: () { makeChoice(2); },
                child: PlayerCard(gamePlayer: widget.gameSpace.gamePlayers[2], showAll: _showAll),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () { makeChoice(3); },
                child: PlayerCard(gamePlayer: widget.gameSpace.gamePlayers[3], showAll: _showAll),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: (_showScoreCard) ?scoreCard() :Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('ROUND ${widget.gameSpace.currentRound}', style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2
                  )),
                  Text(centerMessage,
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.white),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget scoreCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 60),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
      decoration: BoxDecoration(
          color: Color.fromRGBO(137, 44, 220, 1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(
              color: Colors.white54,
              offset: Offset(2,3),
              blurRadius: 5
          )]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('SCORE-BOARD', style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1.2
            )),
          ),
          Table(
            border: TableBorder.all(color: Colors.white38),
            children: [
              TableRow(
                  children: [
                    Text('${widget.gameSpace.gamePlayers[0].playerName}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                    Text('${widget.gameSpace.gamePlayers[0].playerScore}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
                  ]
              ),
              TableRow(
                  children: [
                    Text('${widget.gameSpace.gamePlayers[1].playerName}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                    Text('${widget.gameSpace.gamePlayers[1].playerScore}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
                  ]
              ),
              TableRow(
                  children: [
                    Text('${widget.gameSpace.gamePlayers[2].playerName}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                    Text('${widget.gameSpace.gamePlayers[2].playerScore}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
                  ]
              ),
              TableRow(
                  children: [
                    Text('${widget.gameSpace.gamePlayers[3].playerName}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                    Text('${widget.gameSpace.gamePlayers[3].playerScore}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
                  ]
              )
            ],
          ),
          SizedBox(height: 15),
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: Colors.white)
            ),
            child: Text('Play Again!', style: TextStyle(color: Colors.white)),
            onPressed: (){
              setState(() {
                widget.gameSpace.createGameSpace();
                _showScoreCard = false;
                _absorbing = true;
                centerMessage = 'You are chosen as \n${PLAYER_TYPE[widget.gameSpace.gamePlayers[0].playerType]}';
                Timer(Duration(seconds: 4), () {
                  setState(() {
                    centerMessage = 'Mantri.. Chor sipahi ka pta lgao!';
                    if(widget.gameSpace.gamePlayers[0].playerType == PLAYER_TYPE_MANTRI)
                      _absorbing = false;
                    startGame();
                  });
                });
              });
            },
          ),
          MaterialButton(onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text('End Game?', style: TextStyle(color: Colors.white)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(color: Colors.white)
            ),
          )
        ],
      ),
    );
  }

  void makeChoice(int choice) {
    int chosenPlayerType = widget.gameSpace.gamePlayers[choice].playerType;
    bool choiceCorrect = (chosenPlayerType == PLAYER_TYPE_CHOR);
    if (chosenPlayerType == PLAYER_TYPE_RAJA ||
        chosenPlayerType == PLAYER_TYPE_MANTRI) {
      setState(() {
        centerMessage = 'Isn\'t this choice senseless..';
      });
    } else {
      setState(() {
        centerMessage =
        'Mantri chose ${widget.gameSpace.gamePlayers[choice].playerName}';
      });
      Timer(Duration(milliseconds: 2000), (){
        setState(() {
          _showAll = true;
          centerMessage = choiceCorrect ? 'CORRECT choice!' : 'WRONG choice';
        });
      });
      Timer(Duration(milliseconds: 3500), () {
        setState(() {
          _absorbing = false;
          _showScoreCard = true;
          _showAll = false;
          widget.gameSpace.updateScores((choiceCorrect) ? STATUS_WIN : STATUS_LOSE);
        });
      });
    }
  }

  void startGame() {
    if(widget.gameSpace.gameType == GAME_TYPE_CPU) {
      if(widget.gameSpace.gamePlayers[0].playerType != PLAYER_TYPE_MANTRI) {

        // CPU makes choice
        bool shouldBreak = false;
        var random = Random();
        int choice;
        while(!shouldBreak) {
          choice = random.nextInt(1000)%4;
          int chosenPlayerType = widget.gameSpace.gamePlayers[choice].playerType;
          if(chosenPlayerType==PLAYER_TYPE_SIPAHI || chosenPlayerType == PLAYER_TYPE_CHOR) {
            shouldBreak = true;
          }
        }
        makeChoice(choice);

      }
    } else {

    }
  }

}
