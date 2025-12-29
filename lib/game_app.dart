import 'package:flame/game.dart';
import 'package:flame_game/constants.dart';
import 'package:flame_game/flame_game.dart';
import 'package:flutter/material.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  late final FlameGameExample game;

  @override
  void initState() {
    super.initState();
    game = FlameGameExample();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 60),
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
      ),
    );
  }
}
