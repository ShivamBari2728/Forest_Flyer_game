import 'package:flutter/material.dart';
import 'package:planegame/game/flyplane_game.dart';

class gameoverscreen extends StatelessWidget {
  final FlyplaneGame game;
  static const String id = "gameoverscreen";
  const gameoverscreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(110, 0, 0, 0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/gameover.png",height: 300,width: 300,),
            InkWell(
              onTap: onrestart,
              child: Image.asset("assets/images/replaytext.png",height: 150,width: 150,))
          ],
        ),
      ),
    );
  }

  void onrestart() {
    game.plane1.reset();
    game.overlays.remove("gameoverscreen");
    game.resumeEngine();
  }
}