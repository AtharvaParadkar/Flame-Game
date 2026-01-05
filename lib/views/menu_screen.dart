import 'package:flame_game/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pushNamed(AppRoute.game.name),
          child: Text('Start Game'),
        ),
      ),
    );
  }
}
