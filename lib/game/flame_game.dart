import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame_game/constants.dart';
import 'package:flame_game/game/flame_game_world.dart';
import 'package:flame_game/player.dart';
import 'package:flutter/material.dart';

class FlameGameExample extends FlameGame {
  FlameGameExample()
    : super(
    world: FlameGameWorld(),
        camera: CameraComponent.withFixedResolution(
          width: gameWidth,
          height: gameHeight,
        ),
      );

  @override
  Color backgroundColor() {
    return Color.fromARGB(255, 0, 0, 30);
  }

  // @override
  // FutureOr<void> onLoad() {
  //   super.onLoad();
  //
  //   /// The world is essentially the whole game
  //   // vector x,y 0,0 = center
  //   world.add(
  //     Player(
  //       position: Vector2(-(gameWidth / 4), 0),
  //       radius: gameWidth / 4,
  //       color: Colors.green,
  //     ),
  //   );
  //   world.add(
  //     Player(
  //       position: Vector2(gameWidth / 4, 0),
  //       radius: gameWidth / 4,
  //       color: Colors.greenAccent,
  //     ),
  //   );
  // }
}
