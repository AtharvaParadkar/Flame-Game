import 'package:flame_game/local_data/hive_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ResetGameWidget extends ConsumerWidget {
  const ResetGameWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: Text("Reset The Game"),
              insetPadding: .all(12),
              content: Text(
                "Are you sure? You will lose all progress and everything will be reset. This can't be undone.",
                style: TextStyle(fontSize: 20),
              ),
              actionsAlignment: .center,
              actions: [
                ElevatedButton(
                  onPressed: () => context.pop(),
                  child: Text('No, Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref.read(hiveRepositoryProvider).resetGame();
                    ref.invalidate(hiveRepositoryProvider);
                    HapticFeedback.mediumImpact();
                    context.pop();
                  },
                  child: Text('Yes, Reset Game'),
                ),
              ],
            );
          },
        );
      },
      icon: Icon(Icons.restart_alt_sharp),
    );
  }
}
