import 'dart:async';
import 'dart:developer';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_game/constants.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent with HasGameReference<FlameGameExample> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("player.png");
    size = Vector2(playerWidth, playerHeight);
    position = Vector2(0, -(gameHeight / 2) + (size.y / 2));
    angle = 0.5;
    anchor = Anchor.center;
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    /// dt has microsecond precision
    /// multiplying by dt will create continuous fall
    double newY = position.y + (dt * 400);

    if (newY > -(gameHeight / 4)) {
      newY = -(gameHeight / 4);
    }

    if (newY > (gameHeight / 2) - (size.y / 2)) {
      newY = (gameHeight / 2) - (size.y / 2);
    }

    position.y = newY;
  }

  void move(double deltaX) {
    double newX = position.x + deltaX;
    // to not go outside of the screen
    double minX = -(gameWidth / 2) + size.x / 2;
    double maxX = (gameWidth / 2) - size.x / 2;
    newX = newX.clamp(minX, maxX);
    position.x = newX;
  }
}

// class Player extends CircleComponent {
//   Player({
//     required super.position,
//     required double radius,
//     Color color = Colors.white,
//   }) : super(
//          anchor: Anchor.center,
//          radius: radius,
//          paint: Paint()
//            ..color = color
//            ..style = PaintingStyle.fill,
//        );
// }
