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

class Obstacle1 extends Obstacles {
  Obstacle1({super.spritePath = 'obstacle.png'});
}

class Obstacle2 extends Obstacles {
  Obstacle2({super.spritePath = 'obstacle.png'});
}

class Obstacle3 extends Obstacles {
  Obstacle3({super.spritePath = 'obstacle.png'});
}