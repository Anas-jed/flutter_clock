import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

class StopWatchView extends StatefulWidget {
  const StopWatchView({super.key});

  @override
  State<StopWatchView> createState() => _StopWatchViewState();
}

class _StopWatchViewState extends State<StopWatchView> {
  late Timer timer;
  // int elapsedTime = 0;
  String timerString = '00 : 00 : 00';
  Duration duration = Duration.zero;

  startTimer() {
    //  hours: duration?.inHours ?? 0,
    //         minutes: duration?.inMinutes ?? 0,
    //         seconds: duration?.inSeconds ?? 0)
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        // elapsedTime = timer.tick;
        duration = Duration(seconds: timer.tick);
      });
    });
  }

  stopTimer(bool reset) {
    timer.cancel();
    if (reset) {
      resetTimer();
    }
  }

  resetTimer() {
    timerString = '00 : 00 : 00';
  }

  // getTimerString() {
  //   String twoDigits (int n) => n.toString().padLeft(2,'0');
  //   String time = '00 : 00 : 00';

  //   if(elapsedTime > 3600){
  //     time =
  //   }else if( elapsedTime < 3600 && elapsedTime > 60 ){

  //   }else{

  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          duration.toString(),
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // stopwatch.stop();
                  setState(() {
                    stopTimer(true);
                  });
                },
                child: const Icon(Icons.stop)),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    stopTimer(false);
                  });
                },
                child: const Icon(Icons.pause)),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    startTimer();
                  });
                },
                child: const Icon(Icons.play_arrow))
          ],
        )
      ],
    );
  }
}
