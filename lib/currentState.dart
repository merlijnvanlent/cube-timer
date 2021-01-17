import 'package:flutter/material.dart';
import 'package:timer/durationTimer.dart';

class CurrentState {
  var _states = [
    0, // before
    1, // running
    2, // after
  ];

  int _stateIndex = 0;
  int get state => _states[_stateIndex];

  int next(timer) {
    if (_stateIndex + 1 >= _states.length) {
      _stateIndex = 0;
    } else {
      _stateIndex++;
    }

    _UpdateTimer(timer);

    return _stateIndex;
  }

  void _UpdateTimer(timer) {
    switch (_stateIndex) {
      case 0:
        timer.reset();
        break;

      case 1:
        timer.start();
        break;

      case 2:
        timer.stop();
        break;
    }
  }

  // state dependent properties
  var _backgroundColors = [
    Colors.green[800],
    Colors.red[800],
    Colors.orange[800],
  ];
  Color get backgroundColor => _backgroundColors[_stateIndex];
}
