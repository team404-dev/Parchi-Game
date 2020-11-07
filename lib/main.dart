import 'package:flutter/material.dart';
import 'package:parchi_lub/screens/instructions.dart';
import 'package:parchi_lub/screens/main_menu.dart';
import 'package:parchi_lub/screens/vs_cpu.dart';
import 'package:parchi_lub/services/game_space.dart';
import 'package:parchi_lub/widgets/theme_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parchi Lub',
      home: HomePage(),
      theme: AppTheme,
      routes: {
        'mainMenu': (context) => MainMenu(),
        'vsCpu': (context) => VsCpuGame(),
        'instructions': (context) => Instructions()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MainMenu();
  }
}