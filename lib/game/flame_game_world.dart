import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flame_game/game/sprites/bin.dart';
import 'sprites/player.dart';

class FlameGameWorld extends World with HasGameReference<FlameGameExample> {
  late final Player player;
  late final Bin bin;
  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    /// The world is essentially the whole game
    player = Player();
    add(player);
    bin = Bin();
    add(bin);
  }
}
