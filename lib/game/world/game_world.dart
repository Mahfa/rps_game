import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:rps_game/game/components/arena.dart';
import 'package:rps_game/game/components/paper.dart';
import 'package:rps_game/game/components/rock.dart';
import 'package:rps_game/game/components/scissors.dart';

class GameWorld extends Forge2DGame {
  final Random r;
  final List<BodyComponent<GameWorld>> items;
  final List<Vector2> positions;
  GameWorld()
      : r = Random(),
        items = [],
        positions = [],
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
      items.add(Rock(position: _getNotUsedRandomPosition()));
      items.add(Paper(position: _getNotUsedRandomPosition()));
      items.add(Scissors(position: _getNotUsedRandomPosition()));
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


  Vector2 _getNotUsedRandomPosition(){
    Vector2 r = _randomPos();
    for(Vector2 pos in positions){
      if(pos.distanceTo(r) < 0.5){
        return _getNotUsedRandomPosition();
      }
    }
    positions.add(r);
    return r;
  }

  _randomPos() {
    double x = r.nextDouble();
    double y = r.nextDouble();
    if (x >= 0.9) {
      x = 0.9;
    }
    if (x <= 0.1) {
      x = 0.1;
    }
    if (y >= 0.9) {
      y = 0.9;
    }
    if (y <= 0.1) {
      y = 0.1;
    }
    return Vector2(size.x*x, size.y*y);
  }
}
