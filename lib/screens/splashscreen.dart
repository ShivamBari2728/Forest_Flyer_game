import 'package:flutter/material.dart';
import 'package:planegame/game/flyplane_game.dart';

class Splashscreen extends StatelessWidget {
  static const id = 'Splashscreen';
  final FlyplaneGame game;

  const Splashscreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    game.pauseEngine(); // Pause the game during splash screen

    return Container(
      color: const Color.fromARGB(255, 116, 192, 255), // Background color
      child: Column(
        children: [
          const Spacer(), // Push the content to the center
          // Centered Content: Logo and Progress Indicator
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset("assets/images/logo.png"),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(color: Colors.white),
            ],
          ),
          const Spacer(), // Push the row to the bottom

          // Row with GitHub Logo and Username
          Padding(
            padding: const EdgeInsets.only(bottom: 20), // Add padding at the bottom
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/git.png",
                  height: 35,
                  width: 35,
                ),
                const SizedBox(width: 10),
                const Text(
                  "@ShivamBari2728",
                  style: TextStyle(
                    fontFamily: "Game",
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
