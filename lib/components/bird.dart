import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flappygame/game/assets.dart';
import 'package:flappygame/game/bird_movement.dart';
import 'package:flappygame/game/comfiguration.dart';
import 'package:flappygame/game/flappy_bird_game.dart';
import 'package:flutter/animation.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  int score = 0;

  @override
  Future<void> onLoad() async {
    final bidMidFlap = await gameRef.loadSprite(Asset.birdMidFlap);
    final bidUpFlap = await gameRef.loadSprite(Asset.birdUpFlap);
    final bidDownUp = await gameRef.loadSprite(Asset.birdDownFlap);

    size = Vector2(80, 50);
    current = BirdMovement.middle;
    position = Vector2(20, gameRef.size.y / 2 - size.y / 2);
    sprites = {
      BirdMovement.middle: bidMidFlap,
      BirdMovement.down: bidDownUp,
      BirdMovement.up: bidUpFlap,
    };
    add(CircleHitbox());
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
    print('collision.........');
  }

  void gameOver() {
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
    game.isHit = true;
    FlameAudio.play(Asset.collision);
  }

  void reset() {
    position = Vector2(80, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }

  void fly() {
    add(MoveByEffect(
      Vector2(0, Config.gravity),
      EffectController(duration: 0.5, curve: Curves.decelerate),
      onComplete: () => current = BirdMovement.down,
    ));
    current = BirdMovement.up;
    FlameAudio.play(Asset.fly);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if (position.y < 1) {
      gameOver();
    } else if (position.y > gameRef.size.y) {
      gameOver();
    }
  }
}
