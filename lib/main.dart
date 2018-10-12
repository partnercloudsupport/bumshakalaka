import 'dart:ui';

import 'package:bumshakalaka/game/flame_wrapper.dart';
import 'package:bumshakalaka/game/game.dart';
import 'package:bumshakalaka/logic/game_logic.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

main() async {
  FlameWrapper engine = new FlameWrapper();

  new Main(engine);
}

class Main {
  Game game;

  Main(FlameWrapper engine) {
    engine.disableAudioLog();
    engine.loadAudio("megaman.mp3");
    engine.loadAllImages([
      'red_apple.png',
      'cheese.png',
      'compost.png',
      'dog.png',
      'dumpster.png',
      'fish.png',
      'fridge.png',
      'lemon.png',
      'green_apple.png',
      'whole_grilled_chicken.png',
    ]);
    game = new Game(new GameLogic());
    engine.addGestureRecognizer(new ImmediateMultiDragGestureRecognizer()
      ..onStart = (Offset event) => game.input(event));
    runApp(game.widget);
  }
}
