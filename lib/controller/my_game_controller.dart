import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pocman_game/pages/home_page.dart';
import '../game.dart';
import '../main.dart';

class MyGameController extends GameComponent {
  bool endGame = false;
  bool gameOver = false;

  @override
  void update(double dt) {
    if (isScared) {
      timer -= 1;
      if (timer == 0) {
        isScared = false;
        timer = 200;
      }
    }

    if (checkInterval('end game', 500, dt)) {
      if (gameRef.decorations().isEmpty && !endGame) {
        endGame = true;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('Parábens, você zerou o jogo!'),
                actions: [
                  TextButton(
                    child: const Text('Ir para o inicio!'),
                    onPressed: () {
                      _goHome();
                    },
                  )
                ],
              );
            });
      }
    }

    if (checkInterval('gameover', 500, dt)) {
      if (died == true && !gameOver) {
        gameOver = true;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('Game Over!'),
                actions: [
                  TextButton(
                      child: const Text('Tentar novamente!'),
                      onPressed: () {
                        _restart(1);
                        died = false;
                      }),
                  TextButton(
                    child: const Text('Ir para o inicio!'),
                    onPressed: () {
                      _goHome();
                    },
                  )
                ],
              );
            });
      }
    }

    super.update(dt);
  }

  void _restart(int newStage) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return Game(stage: newStage);
    }), (route) => false);
  }

  void _goHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const HomePage();
    }), (route) => false);
    score = 0;
  }
}
