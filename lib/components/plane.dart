import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:planegame/components/config.dart';
import 'package:planegame/game/assets.dart';
import 'package:planegame/game/flyplane_game.dart';
import 'package:planegame/screens/gameover.dart';

class plane extends SpriteComponent
    with HasGameRef<FlyplaneGame>, CollisionCallbacks {
  plane();
  int score = 0;
  @override
  FutureOr<void> onLoad() async {
    
    //  final Buildinggroup buildinggroup;
    final planeimage = await Flame.images.load(Assets.plane);
    size = Vector2(60, 60);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprite = Sprite(planeimage);

    add(RectangleHitbox.relative(Vector2(0.8, 0.5), parentSize: size));

    //  debugMode = true; // true to view hitboxes
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    debugPrint("colision");
    gameover();
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    position.y += config.planevilocity * 1.2 * dt;
    if(position.y<1){
      gameover();
    }
  }

  void fly() {
   
    add(MoveByEffect(Vector2(0, config.gravity),
        EffectController(duration: 0.2, curve: Curves.decelerate)));
  }

  void gameover() {
    game.ishit = true;
    game.overlays.add(gameoverscreen.id);
    gameRef.pauseEngine();
  }

  void reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }
}
