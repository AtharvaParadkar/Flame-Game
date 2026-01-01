import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flame_game/game/sprites/player.dart';

import '../../constants.dart';

class Obstacles extends SpriteComponent
    with HasGameReference<FlameGameExample>, CollisionCallbacks {
  final String spritePath;
  final bool circleHitBox;

  Obstacles({this.circleHitBox = false, required this.spritePath});

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    anchor = Anchor.center;
    if (circleHitBox == true) {
      add(CircleHitbox());
    } else {
      add(RectangleHitbox());
    }
  }
}

class ObstacleTrash extends Obstacles {
  ObstacleTrash({super.spritePath = 'trash.png', super.circleHitBox = true});

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class ObstacleWater extends Obstacles {
  ObstacleWater({super.spritePath = 'water.png', super.circleHitBox = true});

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class ObstacleFire extends Obstacles {
  ObstacleFire({super.spritePath = 'fire.png', super.circleHitBox = true});

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Player) {
      other.removeFromParent();
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}