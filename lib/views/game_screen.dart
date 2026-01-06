import 'dart:developer';

import 'package:flame/game.dart';
import 'package:flame_game/constants.dart';
import 'package:flame_game/game/flame_game.dart';
import 'package:flame_game/game_end_state.dart';
import 'package:flame_game/local_data/hive_repository.dart';
import 'package:flame_game/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late final FlameGameExample game;

  @override
  void initState() {
    super.initState();
    game = FlameGameExample(
      onCallback: (GameEndState gameEndState) {

        // save attempt
        ref.read(hiveRepositoryProvider).savedAttempt(gameEndState);

        log("!@@@@@@@@@@@!!!!!!!!!!!!!!! $gameEndState");
        context.goNamed(AppRoute.end.name,extra: gameEndState);
      },
    );
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
