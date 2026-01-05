import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_repository.g.dart';

class HiveRepository {
  final box=Hive.box('gameDB');

  dynamic getValue (String key){
    return box.get(key);
  }

  void savedAttempt() {
    // get the saved attempts
    final attempts = box.get("totalAttempts",defaultValue: 0);
    box.put("totalAttempts", attempts+1);
    log("Saved attempts - $attempts");
  }
}

@Riverpod(keepAlive: true)
HiveRepository hiveRepository (Ref ref) {
  return HiveRepository();
}