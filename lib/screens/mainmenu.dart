import 'package:flutter/material.dart';
import 'package:planegame/game/flyplane_game.dart';

class Mainmenu extends StatelessWidget {
  final FlyplaneGame game;

  static const String id = "mainmenu";
  const Mainmenu({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    game.pauseEngine();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/menubackground.jpg"),
                fit: BoxFit.cover)),
        child: Center(
          child: SizedBox(
            height: 500,
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/titletext.png",
                ),
                SizedBox(
                  height: 70,
                ),
                InkWell(
                  onTap: () {
                    print("Main menu tapped");
                    game.overlays.remove(Mainmenu.id);
                    print("Overlay removed");
                    game.resumeEngine();
                    print("Game resumed");
                  },
                  child: Image.asset(
                    "assets/images/playbutton.png",
                    width: 150, // Set your desired width
                    height: 150,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
