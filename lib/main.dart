import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:timer/currentState.dart';
import 'package:timer/durationTimer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CubeTimer());
}

class CubeTimer extends StatefulWidget {
  @override
  _CubeTimerState createState() => _CubeTimerState();
}

class _CubeTimerState extends State<CubeTimer> {
  DurationTimer _watch = DurationTimer();
  CurrentState _state = CurrentState();

  @override
  Widget build(BuildContext context) {
    // Setstate to update the timer every x seconds.
    _watch.addListener(
      () {
        setState(() {});
      },
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text('Cube timer'),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.access_time),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          color: _state.backgroundColor,
          child: SafeArea(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                setState(() {
                  _state.next(_watch);
                });
              },
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_watch.currentDuration.toString()}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Press anywhere to start and/or stop.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
