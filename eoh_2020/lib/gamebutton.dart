import 'package:flutter/material.dart';

class GameButton {
  final id;
  int number;
  bool enabled;
  Image icon;
  bool correct;

  GameButton(
      {this.id, this.icon, this.enabled = false, this.number, this.correct});
}
