import 'package:flutter/material.dart';
import 'core/puzzle_animator.dart';
import 'puzzle_home_state.dart';

class PuzzleHome extends StatefulWidget {
  final int _rows, _columns;

  const PuzzleHome(this._rows, this._columns);

  @override
  PuzzleHomeState createState() =>
      PuzzleHomeState(PuzzleAnimator(_columns, _rows));
}
