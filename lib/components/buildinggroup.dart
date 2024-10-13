import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:planegame/components/building.dart';
import 'package:planegame/components/buildingposition.dart';
import 'package:planegame/components/config.dart';
import 'package:planegame/game/flyplane_game.dart';

class Buildinggroup extends PositionComponent with HasGameRef<FlyplaneGame> {
  Buildinggroup();
  final _random = Random();
  final double minGroundSpace = 100; // Space between buildings and the ground
  final double minBuildingSpace =
      100; // Space between the two buildings (Reduced)

  @override
  FutureOr<void> onLoad() {
    final avilablescreen = gameRef.size.y - config.groundheight;

    // Adjust the available screen space to account for the ground space
    final adjustedScreen = avilablescreen - minGroundSpace;

    // Adjust the spacing to be smaller to reduce the gap between buildings
    final spacing = minBuildingSpace +
        _random.nextDouble() * (adjustedScreen / 6); // Decreased spacing
    final centerY = spacing + _random.nextDouble() * (adjustedScreen - spacing);

    // Set the x position for the buildings to the edge of the screen
    position.x = gameRef.size.x;

    addAll([
      building(
          height: centerY - spacing / 2,
          buildingposition: Buildingposition.top),
      building(
          height: adjustedScreen - (centerY + spacing),
          buildingposition: Buildingposition.bottom)
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= config.gamespeed * dt;
    if (game.ishit) {
      removeFromParent();
      gameRef.ishit = false;
    }
    // Remove the building when it moves off-screen
    if (position.x < -200) {
      removeFromParent();
      gameRef.plane1.score += 1;
      debugPrint("removed");
    }
  }
}
