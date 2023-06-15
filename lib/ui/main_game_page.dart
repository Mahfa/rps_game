import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../forge2d_game_world.dart';

class MainGamePage extends StatefulWidget {
  const MainGamePage({super.key});

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MainGamePage> {
  final forge2dGameWorld = Forge2dGameWorld();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Container(
        color: Colors.black,
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 40,
        ),
        child: GameWidget(
          game: forge2dGameWorld,
        ),
      ),
    );
  }
}
