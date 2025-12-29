import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_game/constants.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("sprite.png");
    size = Vector2.all(100);
    position = Vector2(0, -(gameHeight / 2) + (size.y / 2));
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);

    /// dt has microsecond precision
    /// multiplying by dt will create continuous fall
    double newY = position.y + (dt * 400);

    if (newY > (gameHeight / 2) - (size.y / 2)) {
      newY = (gameHeight / 2) - (size.y / 2);
    }

    position.y = newY;
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
