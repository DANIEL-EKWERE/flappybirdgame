import 'package:flappygame/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  static const String id = 'gameOver';
  final FlappyBirdGame game;
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 230,
            ),
            Text(
              'score: ${game.bird!.score}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            const Image(
              image: AssetImage('assets/images/gameover.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: onRestart,
                child: const Text('Restart'))
          ],
        ),
      ),
    );
  }

  onRestart() {
    game.bird!.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
