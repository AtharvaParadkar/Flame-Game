import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_game/constants.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flame_game/game/sprites/bin.dart';
import 'package:flame_game/game/sprites/obstacles.dart';
import 'sprites/player.dart';

class FlameGameWorld extends World with HasGameReference<FlameGameExample> {
  late final Player player;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    /// The world is essentially the whole game
    player = Player();
    add(player);
    add(Bin());

    add(Obstacle1()..position = Vector2(0, 0));
    add(Obstacle2()..position = Vector2(-obstacleSize * 2, 0));
    add(Obstacle3()..position = Vector2(obstacleSize * 2, 0));
  }

  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Obstacles>().forEach((obs) {
      obs.position.y -= (dt * 400);

      if (obs.position.y < -(gameHeight / 2)) {
        obs.position.y = gameHeight;
      }
    });
  }
}
