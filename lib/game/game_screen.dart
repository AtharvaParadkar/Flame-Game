import 'package:flame/game.dart';
import 'package:flame_game/constants.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final FlameGameExample game;

  @override
  void initState() {
    super.initState();
    game = FlameGameExample();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F1F8), //lavender
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: SizedBox(
              height: gameHeight,
              width: gameWidth,
              child: GameWidget(game: game),
            ),
          ),
        ),
      ),
    );
  }
}
