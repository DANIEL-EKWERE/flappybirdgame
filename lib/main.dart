import 'package:flame/game.dart';
import 'package:flappygame/game/flappy_bird_game.dart';
import 'package:flappygame/screens/game_over_screen.dart';
import 'package:flappygame/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(game: game,
  initialActiveOverlays:const [MainMenu.id],
  overlayBuilderMap: {
    'mainMenu': (context,_) => MainMenu(game: game),
    'gameOver': (context,_) => GameOverScreen(game: game),
  },
  ));
}
