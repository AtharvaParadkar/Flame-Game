import 'package:flame/game.dart';
import 'package:flame_game/flame_game.dart';
import 'package:flutter/material.dart';

void main () {
  final game = FlameGameExample();
  runApp(GameWidget(game: game));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
