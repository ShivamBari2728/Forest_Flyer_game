import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/painting.dart';
import 'package:planegame/components/background.dart';

import 'package:planegame/components/buildinggroup.dart';

import 'package:planegame/components/ground.dart';
import 'package:planegame/components/plane.dart';

class FlyplaneGame extends FlameGame with TapDetector, HasCollisionDetection {
  late plane plane1;
  late Timer interval;
  late TextComponent score;
  bool ishit = false;

  @override
  FutureOr<void> onLoad() {
    
    interval = Timer(2, repeat: true);
    addAll([
      Background(),
      ground(),
      plane1 = plane(),
      score = buildscore(),
    ]);
    interval.onTick = () => add(Buildinggroup());
  }

  @override
  void onTap() {
    // TODO: implement onTap
    super.onTap();
    plane1.fly();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    interval.update(dt);
    score.text = "Score = ${plane1.score}";
  }

  TextComponent buildscore() {
    return TextComponent(
        text: "score = 0",
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer:
            TextPaint(style: TextStyle(fontFamily: "Game", fontSize: 40)));
  }
}
