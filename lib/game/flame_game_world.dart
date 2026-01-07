import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_game/constants.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flame_game/game/level_data.dart';
import 'package:flame_game/game/sprites/bin.dart';
import 'package:flame_game/game/sprites/obstacles.dart';
import 'sprites/player.dart';

class FlameGameWorld extends World with HasGameReference<FlameGameExample> {
  late final Player player;

  void loadLevel(List<ObstacleData> levelData) {
    // remove any existing Obstacles
    removeAll(children.whereType<Obstacles>().toList());

    // load new obstacles from level data
    for (var data in levelData) {
      Obstacles obstacle;
      if (data.type == ObstacleType.trash) {
        obstacle = ObstacleTrash()..position = data.position;
      } else if (data.type == ObstacleType.water) {
        obstacle = ObstacleWater()..position = data.position;
      } else if (data.type == ObstacleType.fire) {
        obstacle = ObstacleFire()..position = data.position;
        } else if (data.type == ObstacleType.binTrash) {
          obstacle = BinTrash()..position = data.position;
        } else if (data.type == ObstacleType.binRecycle) {
          obstacle = BinRecycle()..position = data.position;
      } else {
        continue;
      }
      add(obstacle);
    }
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    /// The world is essentially the whole game
    player = Player();
    add(player);

    // add(ObstacleTrash()..position = Vector2(0, 0));
    // add(ObstacleWater()..position = Vector2(-obstacleSize * 2, 0));
    // add(ObstacleFire()..position = Vector2(obstacleSize * 2, 0));
    // loadLevel(LevelData().getLevel(5));
    loadLevel(LevelData().getLevel(game.level));
  }

  @override
  void update(double dt) {
    super.update(dt);

    children.whereType<Obstacles>().forEach((obs) {
      obs.position.y -= (dt * 400);

      if (obs.position.y < -(gameHeight / 2)) {
        obs.position.y = extendedHeight;
      }
    });
  }
}
