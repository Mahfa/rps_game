import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:rps_game/game/components/arena.dart';
import 'package:rps_game/game/components/paper.dart';
import 'package:rps_game/game/components/rock.dart';
import 'package:rps_game/game/components/scissors.dart';

class GameWorld extends Forge2DGame {
  final Random r;
  final List<BodyComponent<GameWorld>> items;

  GameWorld()
      : r = Random(),
        items = [],
        super(gravity: Vector2.zero(), zoom: 20);

  @override
  Future<void> onLoad() async {
    await _loadSprites();
    await _initializeGame();
    await _startMoving();
  }

  Future<void> _loadSprites() async {
    await loadSprite('paper.png');
    await loadSprite('rock.png');
    await loadSprite('scissors.png');
  }

  Future<void> _initializeGame() async {
    items.add(Arena());
    for (int i = 0; i < 5; i++) {
      items.add(Rock(position: _randomPos()));
    }
    for (int i = 0; i < 5; i++) {
      items.add(Paper(position: _randomPos()));
    }
    for (int i = 0; i < 5; i++) {
      items.add(Scissors(position: _randomPos()));
    }
    await addAll(items);
  }

  Future<void> _startMoving() async {
    for (var element in items) {
      if (element is! Arena) {
        element.body.applyLinearImpulse(
            Vector2(r.nextDouble() * 15, r.nextDouble() * 15));
      }
    }
  }

  _randomPos() {
    double factor = r.nextDouble();
    if (factor >= 0.9) {
      factor = 0.9;
    }
    if (factor <= 0.1) {
      factor = 0.1;
    }
    return size * factor;
  }
}
