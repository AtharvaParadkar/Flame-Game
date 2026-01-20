import 'package:flame_game/local_data/hive_repository.dart';
import 'package:flame_game/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/reset_game_widget.dart';

class MenuScreen extends ConsumerStatefulWidget {
  const MenuScreen({super.key});

  @override
  ConsumerState<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends ConsumerState<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    // final gamePlayed= ref.read(hiveRepositoryProvider).getValue('totalAttempts');
    final db = ref.watch(hiveRepositoryProvider);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Menu")),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text('Games played: ${db.getValue('totalAttempts') ?? 0}'),
            Text("Trash: ${db.getValue("trashEndCount") ?? 0}"),
            Text("Water: ${db.getValue("waterEndCount") ?? 0}"),
            Text("Fire: ${db.getValue("fireEndCount") ?? 0}"),
            Text("Recycle: ${db.getValue("recycleEndCount") ?? 0}"),
            ElevatedButton(
              onPressed: () => context.pushNamed(AppRoute.game.name),
              child: Text('Start Game'),
            ),
            ResetGameWidget(),
          ],
        ),
      ),
    );
  }
}
