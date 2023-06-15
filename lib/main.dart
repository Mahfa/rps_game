import 'package:flutter/material.dart';

import 'ui/main_game_page.dart';

void main() {
  runApp(const RPSGame());
}

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
