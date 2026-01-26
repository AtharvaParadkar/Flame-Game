import 'package:flame_audio/flame_audio.dart';
import 'package:flame_game/local_data/hive_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MuteButtonWidget extends ConsumerStatefulWidget {
  const MuteButtonWidget({super.key, this.currentAudio});

  final String? currentAudio;

  @override
  ConsumerState<MuteButtonWidget> createState() => _MuteButtonWidgetState();
}

class _MuteButtonWidgetState extends ConsumerState<MuteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    bool playSound = ref.watch(canPlaySoundProvider);
    return IconButton(
      onPressed: () {
        if (playSound == true) {
          FlameAudio.bgm.stop();
        } else {
          if (widget.currentAudio != null) {
            FlameAudio.bgm.initialize();
            FlameAudio.bgm.play(widget.currentAudio!, volume: 0.1);
          }
        }
        ref.read(canPlaySoundProvider.notifier).toggle();
      },
      icon: playSound
          ? Icon(Icons.music_note_outlined)
          : Icon(Icons.music_off_outlined),
    );
  }
}
