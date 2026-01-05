import 'package:flame_game/game/game_screen.dart';
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
        builder: (context, state) {
          return const MenuScreen();
        },
      ),
      GoRoute(
        path: '/game',
        name: AppRoute.game.name,
        pageBuilder: (context, state) {
          return const MaterialPage(
            fullscreenDialog: true,
            child: GameScreen(),
          );
        },
      ),
      GoRoute(
        path: '/end',
        name: AppRoute.end.name,
        pageBuilder: (context, state) {
          return const MaterialPage(fullscreenDialog: true, child: EndScreen());
        },
      ),
    ],
  );
}
