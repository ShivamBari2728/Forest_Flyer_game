import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'package:planegame/game/flyplane_game.dart';
import 'package:planegame/screens/gameover.dart';
import 'package:planegame/screens/mainmenu.dart';
import 'package:planegame/screens/splashscreen.dart';

void main() {
  final game = FlyplaneGame();

  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [Splashscreen.id], // Show splash first
    overlayBuilderMap: {
      Splashscreen.id: (context, _) => Splashscreen(game: game),
      Mainmenu.id: (context, _) => Mainmenu(game: game),
      gameoverscreen.id: (context, _) => gameoverscreen(game: game),
    },
  ));


  Future.delayed(const Duration(seconds: 3), () {
    game.overlays.remove(Splashscreen.id); // Remove splash
    game.overlays.add(Mainmenu.id); // Show main menu
  });
}
