import 'package:flame/flame.dart';
import 'package:flame_game/game_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(GameApp());
}
