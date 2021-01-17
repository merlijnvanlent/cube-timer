import 'package:flutter/material.dart';
import 'dart:async';

class DurationTimer extends ChangeNotifier {
  Stopwatch _stopwatch;
  Timer _timer;

  Duration get currentDuration => _currentDuration;
  Duration _currentDuration = Duration.zero;

  bool get isRunning => _stopwatch.isRunning;

  DurationTimer() {
    _stopwatch = Stopwatch();
  }

  void start() {
    _stopwatch.start();

    _timer = Timer.periodic(
      Duration(
        milliseconds: 1,
      ),
      _onTick,
    );
  }

  void stop() {
    _stopwatch.stop();
  }

  void reset() {
    stop();
    _stopwatch.reset();
    _timer = null;
  }

  void _onTick(Timer timer) {
    _currentDuration = _stopwatch.elapsed;

    notifyListeners();
  }
}
