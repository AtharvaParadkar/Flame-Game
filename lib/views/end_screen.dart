import 'package:flame_game/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({super.key});

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Game Over")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.pushNamed(AppRoute.game.name),
              child: Text('Play Again'),
            ),
            TextButton(
              onPressed: () => context.pushNamed(AppRoute.menu.name),
              child: Text('Main Menu'),
            ),
          ],
        ),
      ),
    );
  }
}
