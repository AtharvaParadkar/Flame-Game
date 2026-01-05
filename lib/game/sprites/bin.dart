import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flame_game/game/sprites/obstacles.dart';
import 'package:flame_game/game/sprites/player.dart';
import 'package:flame_game/game_end_state.dart';
import 'package:flutter/material.dart';

class Bin extends SpriteComponent
    with HasGameReference<FlameGameExample>, CollisionCallbacks {

  final String spritePath;

  Bin({required this.spritePath});

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load(spritePath);
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  bool onComponentTypeCheck(PositionComponent other) {
    if (other is Obstacles || other is Bin) {
      // do not collide with other obstacles or bin
      return false;
    }
    return super.onComponentTypeCheck(other);
  }
}

class BinTrash extends Obstacles {
  BinTrash({super.spritePath = "bin_trash.png"});

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      other.removeFromParent();
      // end state set
      game.onCallback(GameEndState.trash);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}

class BinRecycle extends Obstacles {
  BinRecycle({super.spritePath="bin_recycle.png"});

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Player) {
      other.removeFromParent();
      debugPrint("{{{{{{*}}}}}} Hit recycle bin");
      // win state set
      game.onCallback(GameEndState.recycle);
    }
    super.onCollisionStart(intersectionPoints, other);
  }
}