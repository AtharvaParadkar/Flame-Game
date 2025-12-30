import 'dart:async';

import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_game/constants.dart';
import 'package:flame_game/game/flame_game_world.dart';
import 'package:flame_game/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlameGameExample extends FlameGame<FlameGameWorld>
    with HorizontalDragDetector, KeyboardEvents {
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

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    super.onHorizontalDragUpdate(info);
    world.player.move(info.delta.global.x);
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    const double speed = 55.0;

    if (event is KeyDownEvent) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight) ||
          keysPressed.contains(LogicalKeyboardKey.keyD)) {
        world.player.move(speed);
        return KeyEventResult.handled;
      } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) ||
          keysPressed.contains(LogicalKeyboardKey.keyA)) {
        world.player.move(-speed);
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
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
