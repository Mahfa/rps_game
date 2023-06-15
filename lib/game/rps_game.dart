import 'package:flutter/material.dart';
import 'package:rps_game/game/page/main_game_page.dart';

class RPSGame extends StatelessWidget {
  const RPSGame({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RPS',
      home: MainGamePage(),
    );
  }
}
