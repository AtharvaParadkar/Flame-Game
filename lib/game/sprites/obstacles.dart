import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/game/flame_game.dart';

import '../../constants.dart';

class Obstacles extends SpriteComponent with HasGameReference<FlameGameExample>, CollisionCallbacks{
  final String spritePath;

  Obstacles({required this.spritePath});

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    size = Vector2.all(obstacleSize);
    anchor = Anchor.center;
    add(CircleHitbox());
  }
}

class ObstacleTrash extends Obstacles {
  ObstacleTrash({super.spritePath = 'trash.png'});
}

class ObstacleWater extends Obstacles {
  ObstacleWater({super.spritePath = 'water.png'});
}

class ObstacleFire extends Obstacles {
  ObstacleFire({super.spritePath = 'fire.png'});
}