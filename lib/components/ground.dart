import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:planegame/components/config.dart';
import 'package:planegame/game/assets.dart';
import 'package:planegame/game/flyplane_game.dart';


class ground extends ParallaxComponent<FlyplaneGame> with CollisionCallbacks,HasGameRef<FlyplaneGame>{

  @override
  FutureOr<void> onLoad() async {
    parallax = Parallax(
      [ParallaxLayer(ParallaxImage(await Flame.images.load(Assets.ground),fill: LayerFill.none))]
    );
    add(RectangleHitbox(
      position: Vector2(0, gameRef.size.y - config.groundheight*1.5),
      size: Vector2(gameRef.size.x, config.groundheight)
    ));
    // debugMode = true;
  }
  @override
  
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    parallax?.baseVelocity.x = config.gamespeed;
  }
  
}