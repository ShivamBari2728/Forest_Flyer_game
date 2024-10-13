import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:planegame/game/assets.dart';
import 'package:planegame/game/flyplane_game.dart';

class Background extends SpriteComponent with HasGameRef<FlyplaneGame>{
    Background();
    @override
  FutureOr<void> onLoad() async{
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }

}