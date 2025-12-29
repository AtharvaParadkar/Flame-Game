import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame_game/player.dart';
import 'package:flutter/material.dart';

class FlameGameExample extends FlameGame {
  @override
  Color backgroundColor() {
    return Color.fromARGB(255, 0, 0, 30);
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    /// The world is essentially the whole game
    // vector x,y 0,0 = center
    world.add(
      Player(position: Vector2(0, 0), radius: 50.0, color: Colors.green),
    );
    world.add(
      Player(position: Vector2(300, 0), radius: 30.0, color: Colors.greenAccent),
    );
  }
}
