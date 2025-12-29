import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_game/game/flame_game.dart';
import '../player.dart';

class FlameGameWorld extends World with HasGameReference<FlameGameExample> {
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    /// The world is essentially the whole game
    add(Player());
  }
}
