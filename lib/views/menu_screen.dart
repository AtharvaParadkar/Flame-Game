import 'package:flame_game/local_data/hive_repository.dart';
import 'package:flame_game/router.dart';
import 'package:flame_game/widgets/mute_button_widget.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Menu"),
        actions: const [MuteButtonWidget(currentAudio: "bg_win.mp3")],
      ),
      body: Padding(
        padding: const .all(20),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text("Progress", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),

            statCard(
              "Games Played",
              db.getValue('totalAttempts') ?? 0,
              Icons.games,
              Colors.indigo,
            ),

            statCard(
              "Trash Ends",
              db.getValue("trashEndCount") ?? 0,
              Icons.delete,
              Colors.grey,
            ),

            statCard(
              "Water Ends",
              db.getValue("waterEndCount") ?? 0,
              Icons.water_drop,
              Colors.blue,
            ),

            statCard(
              "Fire Ends",
              db.getValue("fireEndCount") ?? 0,
              Icons.local_fire_department,
              Colors.red,
            ),

            statCard(
              "Recycle Wins",
              db.getValue("recycleEndCount") ?? 0,
              Icons.recycling,
              Colors.green,
            ),

            const Spacer(),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              icon: const Icon(Icons.play_arrow),
              label: const Text("Start Game"),
              onPressed: () => context.pushNamed(AppRoute.game.name),
            ),

            ResetGameWidget(),
          ],
        ),
      ),
    );
  }

  Widget statCard(String label, int value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelMedium),
                Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
