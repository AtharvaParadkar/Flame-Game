import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_game/game/flame_game.dart';
import '../player.dart';

class FlameGameWorld extends World with HasGameReference<FlameGameExample> {
  late final Player player;
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    /// The world is essentially the whole game
    player = Player();
    add(player);
  }
}
