//import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flappygame/components/background.dart';
import 'package:flappygame/components/bird.dart';
// import 'package:flappygame/components/ground.dart';
import 'package:flappygame/components/pipe_group.dart';
import 'package:flappygame/game/comfiguration.dart';
import 'package:flutter/widgets.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  Bird? bird;
  TextComponent? score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  //Timer interval = Timer(const Duration(seconds: 1.5), () { });
  bool isHit = false;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      // Ground(),
      bird = Bird(),
      PipeGroup(),
      score = buildScore(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
        text: 'Score: 0',
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  @override
  void onTap() {
    super.onTap();
    bird!.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);

    score!.text = 'score ${bird!.score}';
  }
}
