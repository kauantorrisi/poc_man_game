import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pocman_game/pages/home_page.dart';
import '../game.dart';
import '../main.dart';

class MyGameController extends GameComponent {
  bool endGame = false;
  bool gameOver = false;
  final int stage;

  MyGameController(this.stage);

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
                content: const Text('Parábens, você conseguiu!'),
                actions: [
                  TextButton(
                    child: const Text('Próxima fase!'),
                    onPressed: () {
                      _goStage(stage + 1);
                    },
                  )
                ],
              );
            });
      }
    }

    if (checkInterval('end game', 500, dt)) {
      if (gameRef.decorations().isEmpty && !endGame && stage == 2) {
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
                      if (stage == 1) {
                        _goStage(stage);
                        died = false;
                      } else {
                        _goStage(stage - 1);
                        died = false;
                      }
                    },
                  ),
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

  void _goStage(int newStage) {
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
