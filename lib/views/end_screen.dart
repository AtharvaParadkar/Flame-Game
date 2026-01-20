import 'package:flame_game/router.dart';
import 'package:flame_game/widgets/spinning_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../game_end_state.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({super.key, required this.winLose});

  final GameEndState winLose;

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              if (widget.winLose==GameEndState.recycle)
                SizedBox(
                  width: MediaQuery.of(context).size.width *0.9,
                  height: MediaQuery.of(context).size.width *0.9,
                  child: SpinningWheelWidget(),
                ),
              Text("End State: ${widget.winLose == GameEndState.recycle ? 'Win' : 'Lose'}"),
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
      ),
    );
  }
}
