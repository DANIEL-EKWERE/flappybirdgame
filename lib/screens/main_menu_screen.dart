import 'package:flappygame/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE0NDAwODM5LCJpYXQiOjE3MTA4MDA4MzksImp0aSI6ImU2NWE5MzQ3N2MzNjRhMDk4ZTcxZjI1NTViNmJlNDc1IiwidXNlcl9pZCI6MjR9.66ii7xv6hDiNGB0KmPmrQYc7u1c5FeKa7dCEsmqmWd4
class MainMenu extends StatelessWidget {
  static const String id = 'mainMenu';
  final FlappyBirdGame game;

  const MainMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 205,
                ),
                Image.asset('assets/images/game name.png'),
                Image.asset('assets/images/get started.png'),
                const Text(
                  'Tap Screen To Play',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.touch_app,
                  color: Colors.white,
                  size: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
