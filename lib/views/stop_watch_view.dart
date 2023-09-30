import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

import '../exports_all.dart';

class StopWatchView extends StatefulWidget {
  const StopWatchView({super.key});

  @override
  State<StopWatchView> createState() => _StopWatchViewState();
}

class _StopWatchViewState extends State<StopWatchView> {
  late Timer timer;
  Duration duration = Duration.zero;

  void startTimer(Duration? continueDuration) {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        duration = Duration(
            seconds: timer.tick,
            milliseconds: continueDuration?.inMilliseconds ?? 0);
      });
    });
  }

  void stopTimer(bool reset) {
    timer.cancel();
    if (reset) {
      resetTimer();
    }
  }

  void resetTimer() {
    setState(() {
      duration = Duration.zero;
    });
  }

  // ignore: non_constant_identifier_names
  String getHMS({required int HMSFlag}) {
    //0 For hour 1 for Mint 2 for Sec
    if (duration.compareTo(Duration.zero) == 0) {
      return '00';
    }
    if (HMSFlag == 0) {
      return twoDigits(duration.inHours.remainder(60));
    } else if (HMSFlag == 1) {
      return twoDigits(duration.inMinutes.remainder(60));
    } else {
      return twoDigits(duration.inSeconds.remainder(60));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     TimeCardWidget(digits: getHMS(HMSFlag: 0)),
        //     const SizedBox(
        //       width: 30,
        //     ),
        //     TimeCardWidget(digits: getHMS(HMSFlag: 1)),
        //     const SizedBox(
        //       width: 30,
        //     ),
        //     TimeCardWidget(digits: getHMS(HMSFlag: 2)),
        //   ],
        // ),
        TimeCardWidget(
          digits:
              '${getHMS(HMSFlag: 0)}:${getHMS(HMSFlag: 1)}:${getHMS(HMSFlag: 2)}',
          millisec: duration.inMilliseconds.toString(),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  stopTimer(true);
                },
                child: const Icon(Icons.stop)),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  stopTimer(false);
                },
                child: const Icon(Icons.pause)),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (duration.compareTo(Duration.zero) == 0) {
                    startTimer(null);
                  } else {
                    startTimer(duration);
                  }
                },
                child: const Icon(Icons.play_arrow))
          ],
        )
      ],
    );
  }
}
