import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flame_game/game/sprites/player.dart';

class Bin extends SpriteComponent with HasGameReference<FlameGameExample> , CollisionCallbacks{
  @override
  FutureOr<void> onLoad() async{
    sprite = await Sprite.load('recycle_bin.png');
    size = Vector2.all(300);
    position = Vector2(0, (game.size.y / 2) - (size.y /2));
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player && other.position.y > position.y) {
      other.removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }

}