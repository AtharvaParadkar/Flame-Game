import 'package:flame/flame.dart';
import 'package:flame_game/router.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();
  // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(GameApp());
}

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<GameApp> createState() => _GameAppState();
}

class _GameAppState extends State<GameApp> {
  @override
  Widget build(BuildContext context) {
    final router = goRouter();
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}