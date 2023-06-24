import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:rps_game/game/components/paper.dart';
import 'package:rps_game/game/components/rock.dart';
import 'package:rps_game/game/world/game_world.dart';

class Scissors extends BodyComponent<GameWorld> with ContactCallbacks {
  final Vector2 position;

  Scissors({required this.position});
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = Sprite(gameRef.images.fromCache('scissors.png'));
    add(
      SpriteComponent(
        sprite: sprite,
        size: Vector2(0.5, 0.5),
        anchor: Anchor.center,
      ),
    );
  }
  @override
  Body createBody() {
    final bodyDef = BodyDef(userData: this)
      ..type = BodyType.dynamic
      ..position = position;

    final rock = world.createBody(bodyDef);

    final shape = PolygonShape()..setAsBoxXY(0.5, 0.5);

    final fixtureDef = FixtureDef(shape)
      ..restitution = 1.0
      ..density = 1.0;

    rock.createFixture(fixtureDef);
    return rock;
  }
  @override
  void endContact(Object other, Contact contact) {
    super.endContact(other, contact);
    try{
      if(other is Paper){
        other.removeFromParent();
      }
      if(other is Rock){
        removeFromParent();
      }
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
  }
}
