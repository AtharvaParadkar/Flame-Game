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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text("Reset Progress"),
              content: const Text(
                "This will permanently reset all your progress.\n\nAre you sure?",
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    ref.read(hiveRepositoryProvider).resetGame();
                    ref.invalidate(hiveRepositoryProvider);
                    HapticFeedback.mediumImpact();
                    context.pop();
                  },
                  child: const Text("Reset"),
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
