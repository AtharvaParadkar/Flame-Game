import 'dart:developer';

import 'package:flame_game/game_end_state.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_repository.g.dart';

class HiveRepository {
  final box = Hive.box('gameDB');

  dynamic getValue(String key) {
    return box.get(key);
  }

  void savedAttempt(GameEndState endState) {
    // get the saved attempts
    final attempts = box.get("totalAttempts", defaultValue: 0);
    box.put("totalAttempts", attempts + 1);

    final endCounterKey = "${endState.name}EndCount";
    final endCount = box.get(endCounterKey, defaultValue: 0);
    box.put(endCounterKey, endCount + 1);
    log("Saved attempts - ${box.toMap()}");
  }

  int setLevel() {
    final recycleEnd = box.get("recycleEndCount", defaultValue: 0);
    log("LEVEL: ${(recycleEnd + 1).clamp(1, 5)}");
    return (recycleEnd + 1).clamp(1, 5);
  }

  Future<void> resetGame () async {
    await box.clear();
  }
}

@Riverpod(keepAlive: true)
HiveRepository hiveRepository(Ref ref) {
  return HiveRepository();
}
