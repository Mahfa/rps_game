import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';

import 'components/scissors.dart';
import 'components/paper.dart';
import 'components/rock.dart';
import 'components/arena.dart';

class Forge2dGameWorld extends Forge2DGame {
  Forge2dGameWorld() : super(gravity: Vector2.zero(), zoom: 20);
  Random r = Random();
  late final Rock _rock1;
  late final Paper _paper1;
  late final Scissors _scissors1;

  @override
  Future<void> onLoad() async {
    await loadSprite('paper.png');
    await loadSprite('rock.png');
    await loadSprite('scissors.png');
    await _initializeGame();

    _rock1.body.applyLinearImpulse(Vector2(r.nextDouble()*30, r.nextDouble()*30));
    _paper1.body.applyLinearImpulse(Vector2(r.nextDouble()*30, r.nextDouble()*30));
    _scissors1.body.applyLinearImpulse(Vector2(r.nextDouble()*30, r.nextDouble()*30));
  }

  Future<void> _initializeGame() async {
    final arena = Arena();
    await add(arena);


    _rock1 = Rock(
      position: _randomPos(),
    );
    _paper1 = Paper(
      position: _randomPos(),
    );
    _scissors1 = Scissors(
      position: _randomPos(),
    );
    await add(_rock1);
    await add(_paper1);
    await add(_scissors1);
  }
  _randomPos(){
    double factor = r.nextDouble();
    if(factor >= 0.8) {
      factor = 0.8;
    }
    if(factor <= 0.2) {
      factor = 0.2;
    }
    return size * factor;
  }
}
