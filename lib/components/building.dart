import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:planegame/components/buildingposition.dart';
import 'package:planegame/components/config.dart';
import 'package:planegame/game/assets.dart';
import 'package:planegame/game/flyplane_game.dart';

class building extends SpriteComponent with HasGameRef<FlyplaneGame> {
  building({required this.height, required this.buildingposition});
  @override
  final double height;
  final Buildingposition buildingposition;
  FutureOr<void> onLoad() async {
    final building = await Flame.images.load(Assets.building);
    final building_rotated = await Flame.images.load(Assets.building_rotated);
    size = Vector2(200, height);



    switch (buildingposition) {
      case Buildingposition.top:
        position.y = 0;
        sprite = Sprite(building_rotated);

        break;
      case Buildingposition.bottom:
        position.y = gameRef.size.y - size.y - config.groundheight - config.groundheight/2;
        sprite = Sprite(building);
        break;
    }
    add(RectangleHitbox.relative(Vector2(0.1, 1.0), parentSize: size));
    // debugMode = true;
  }
}
