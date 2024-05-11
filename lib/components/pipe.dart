import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappygame/game/assets.dart';
// import 'package:flappygame/game/comfiguration.dart';
import 'package:flappygame/game/flappy_bird_game.dart';
import 'package:flappygame/game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({required this.pipePosition, required this.height});

  @override
  final double height;
  final PipePosition pipePosition;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Asset.pipe);
    final pipeRotated = await Flame.images.load(Asset.pipeRotated);
    size = Vector2(90, height);

    switch (pipePosition) {
      case PipePosition.up:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.down:
        position.y = gameRef.size.y - size.y;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
