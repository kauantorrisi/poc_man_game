import 'package:flutter/material.dart';
import 'package:pocman_game/game.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'PocMan',
              style: TextStyle(
                color: Colors.yellowAccent,
                fontSize: 30,
                fontFamily: 'Silkscreen',
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellowAccent)),
              child: const Text(
                'INICIAR',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Silkscreen',
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return const Game();
                }), (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
