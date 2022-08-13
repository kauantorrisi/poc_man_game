import 'package:bonfire/base/bonfire_game.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;

import '../main.dart';

class Interface extends StatefulWidget {
  static const String overlayKey = 'interface';

  final BonfireGame game;
  const Interface({Key? key, required this.game}) : super(key: key);

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  int scoreGame = 0;
  late async.Timer _timerScore;
  double widthMax = 200;

  @override
  void initState() {
    _timerScore =
        async.Timer.periodic(const Duration(milliseconds: 100), _verifyScore);
    super.initState();
  }

  @override
  void dispose() {
    _timerScore.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 8),
      child: SizedBox(
        width: widthMax,
        height: 13,
        child: Text(
          'Score: $score',
          style: const TextStyle(
              color: Colors.yellow, fontSize: 16, fontFamily: 'Silkscreen'),
        ),
      ),
    );
  }

  void _verifyScore(async.Timer timer) {
    if (scoreGame != score) {
      setState(() {
        scoreGame = score;
      });
    }
  }
}
