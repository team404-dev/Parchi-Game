import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:parchi_lub/widgets/game_title.dart';
import 'package:url_launcher/url_launcher.dart';

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
              children: [
                GameTitle(),
                Text('Play the epic time pass game of all time on mobile phone, Raja-Mantri-Chor-Sipahi. In this version of the game, you can play on several '
                    'available game modes. Rules are simple. You get a post assigned out of the four. Raja needs not much to do and gets 2000 points straight away. '
                    'Its the task of Mantri to find who the thief is, if he gets it right, is awarded 1500 points else 0. And Sipahi gets a 1000 score for just being himself. '
                    'If chor get caught, 0 else 500. Fun.. isn\'t it. Play with your friends and enjoy! \n\nHey wait.. did you see we have chat feature '
                    'as well..', style: TextStyle(color: Colors.white),),
                SizedBox(height: 20),
                Text('Available game modes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('Online Multiplayer', style: TextStyle(color: Colors.white),),
                      subtitle: Text('Play along with several other online players over internet. Join hands with'
                          'random players around the globe and have fun.', style: TextStyle(color: Colors.white),),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('vs CPU', style: TextStyle(color: Colors.white),),
                      subtitle: Text('On a train journey with no proper internet connection? This mode is for you, '
                          'play along side CPU and enjoy!', style: TextStyle(color: Colors.white),),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('Create room', style: TextStyle(color: Colors.white),),
                      subtitle: Text('Want to play with your friends, create a room with unique room key, '
                          'share this with others to join the room and play!', style: TextStyle(color: Colors.white),),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text('Join room', style: TextStyle(color: Colors.white),),
                      subtitle: Text('Your friend must have shared the room key, join his room with other folks, '
                          'and enjoy your day!', style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text('Report a problem?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Contact us!', style: TextStyle(color: Colors.white),),
                  subtitle: GestureDetector(child: Text('team404dev@gmail.com', style: TextStyle(color: Theme.of(context).accentColor)),
                    onTap: () async{
                      final Uri _emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'team404dev@gmail.com',
                          queryParameters: {
                            'subject': 'Report a problem!'
                          }
                      );
                      if(await canLaunch(_emailLaunchUri.toString())) {
                        await launch(_emailLaunchUri.toString());
                      } else {
                        print('Cannot not launch team404dev@gmail.com');
                      }
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('Are you a developer?\nFind the source code at', style: TextStyle(color: Colors.white),),
                  subtitle: GestureDetector(child: Text('https://github.com/team404-dev/Parchi-Game', style: TextStyle(color: Theme.of(context).accentColor)),
                    onTap: () async{
                      const String url = 'https://github.com/team404-dev/Parchi-Game';
                      if(await canLaunch(url)) {
                        await launch(url);
                      } else {
                        print('Cannot not launch $url');
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(width: double.infinity, child: Text(
                  '2020 \u00a9 team404dev', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                )),
                SizedBox(height: 20),
              ],
            ),
        ),
      ),
    );
  }
}
