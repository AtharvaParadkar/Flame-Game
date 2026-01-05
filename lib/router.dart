import 'package:flame_game/game_end_state.dart';
import 'package:flame_game/views/game_screen.dart';
import 'package:flame_game/views/end_screen.dart';
import 'package:flame_game/views/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute { menu, game, end }

GoRouter goRouter() {
  return GoRouter(
    initialLocation: '/menu',
    routes: <RouteBase>[
      GoRoute(
        path: '/menu',
        name: AppRoute.menu.name,
        pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: MenuScreen(),
          ),
      ),
      GoRoute(
        path: '/game',
        name: AppRoute.game.name,
        pageBuilder: (context, state) =>
            NoTransitionPage<void>(key: state.pageKey, child: GameScreen()),
      ),
      GoRoute(
        path: '/end',
        name: AppRoute.end.name,
        pageBuilder: (context, state) {
          final result = state.extra as GameEndState;
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: EndScreen(winLose: result),
          );
        },
      ),
    ],
  );
}
