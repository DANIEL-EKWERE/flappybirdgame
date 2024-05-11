import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappygame/components/pipe.dart';
import 'package:flappygame/game/assets.dart';
import 'package:flappygame/game/comfiguration.dart';
import 'package:flappygame/game/flappy_bird_game.dart';
import 'package:flappygame/game/pipe_position.dart';
// import 'package:flutter/widgets.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();
  final random = Random();
  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;
    final heightMinuGround = gameRef.size.y;
    final spacing = 100 + random.nextDouble() * (heightMinuGround / 4);
    final centerY =
        spacing + random.nextDouble() * (heightMinuGround - spacing);
    addAll([
      Pipe(pipePosition: PipePosition.up, height: centerY - spacing / 2),
      Pipe(
          pipePosition: PipePosition.down,
          height: heightMinuGround - (centerY + spacing / 2)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }
    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird!.score += 1;
    FlameAudio.play(Asset.point);
  }
}
