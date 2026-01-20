import 'dart:async';
import 'dart:math';

import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinningWheelWidget extends StatefulWidget {
  const SpinningWheelWidget({super.key});

  @override
  State<SpinningWheelWidget> createState() => _SpinningWheelWidgetState();
}

class _SpinningWheelWidgetState extends State<SpinningWheelWidget> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? outCome;
    return Material(
      color: Colors.transparent,
      shape: const CircleBorder(),
      elevation: 6,
      child: FortuneWheel(
        onFling: () {
          List<int> o = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
          setState(() {
            outCome = o[Random().nextInt(o.length)];
          });
          selected.add(outCome!);
        },
        onAnimationEnd: () {
          if (outCome == 0) {
            // redirect to win screen
          } else {
            // redirect to lose screen
          }
        },
        animateFirst: false,
        hapticImpact: .heavy,
        indicators: <FortuneIndicator>[
          FortuneIndicator(
            alignment: .topCenter,
            child: TriangleIndicator(
              color: Colors.black54,
              height: 40,
              width: 30,
              elevation: 10,
            ),
          ),
        ],
        selected: selected.stream,
        items: [
          FortuneItem(
            child: RotatedBox(
              quarterTurns: 1,
              child: Padding(
                padding: .only(bottom: 100),
                child: Icon(
                  Icons.recycling_rounded,
                  color: Colors.white,
                  size: 55,
                ),
              ),
            ),
            style: FortuneItemStyle(
              color: Colors.blue.shade500.withAlpha(50),
              borderWidth: 0,
            ),
          ),
          ..._fItem(
            image: "assets/images/trash.png",
            color: Colors.white.withAlpha(150),
          ),
        ],
      ),
    );
  }

  List<FortuneItem> _fItem({required String image, required Color color}) {
    List<FortuneItem> output = [];
    for (int i = 0; i < 9; i++) {
      output.add(
        FortuneItem(
          child: RotatedBox(
            quarterTurns: 1,
            child: Padding(
              padding: .only(bottom: 50),
              child: Image.asset(image, width: 55),
            ),
          ),
          style: FortuneItemStyle(color: color, borderWidth: 0),
        ),
      );
    }
    return output;
  }
}
