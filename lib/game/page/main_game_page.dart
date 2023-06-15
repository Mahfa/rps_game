import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import '../world/game_world.dart';

class MainGamePage extends StatefulWidget {
  const MainGamePage({super.key});

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MainGamePage> {
  final forge2dGameWorld = GameWorld();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        color: Colors.black,
        margin: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 32,
        ),
        child: GameWidget(
          game: forge2dGameWorld,
        ),
      ),
    );
  }
}
