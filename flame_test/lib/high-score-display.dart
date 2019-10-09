import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'langaw-game.dart';

class HighscoreDisplay {
  final LangawGame game;
  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  HighscoreDisplay(this.game) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    Shadow shadow = Shadow(
      blurRadius: 3,
      color: Color(0xff000000),
      offset: Offset.zero,
    );

    textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 30,
      shadows: [shadow, shadow, shadow, shadow],
    );

    position = Offset.zero;

    updateHighscore();
  }

  void updateHighscore() {
    int highscore = game.storage.getInt('highscore') ?? 0;

    painter.text = TextSpan(
      text: 'High-score: ' + highscore.toString(),
      style: textStyle,
    );

    painter.layout();

    position = Offset(
      game.screenSize.width - (game.tileSize * .25) - painter.width,
      game.tileSize * .25,
    );
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void resize() {
    int highscore = game.storage.getInt('highscore') ?? 0;

    Shadow shadow = Shadow(
      blurRadius: game.tileSize * .0625,
      color: Color(0xff000000),
      offset: Offset.zero,
    );

    painter.text = TextSpan(
      text: 'High-score: ' + highscore.toString(),
      style: TextStyle(
        color: Color(0xffffffff),
        fontSize: game.tileSize * .75,
        shadows: <Shadow>[
          shadow,
          shadow,
          shadow,
          shadow,
          shadow,
          shadow,
          shadow,
          shadow
        ],
      ),
    );

    if (painter.text == null) return;
    painter.layout();
    position = Offset(
      game.screenSize.width - (game.tileSize * .25) - painter.width,
      game.tileSize * .25,
    );
  }
}
