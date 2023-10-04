import 'dart:async';
import 'package:flutter/material.dart';

import '../exports_all.dart';

class StopWatchView extends StatefulWidget {
  const StopWatchView({super.key});

  @override
  State<StopWatchView> createState() => _StopWatchViewState();
}

class _StopWatchViewState extends State<StopWatchView> {
  Timer? timer;
  Duration duration = Duration.zero;
  List<Duration> lapDurationList = <Duration>[];

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
    setState(() {
      timer!.cancel();
    });
    if (reset) {
      resetTimer();
    }
  }

  void resetTimer() {
    setState(() {
      duration = Duration.zero;
      lapDurationList = [];
    });
  }

  // ignore: non_constant_identifier_names
  String getHMS({required int HMSFlag, required Duration localD}) {
    //0 For hour 1 for Mint 2 for Sec
    if (localD.compareTo(Duration.zero) == 0) {
      return '00';
    }
    if (HMSFlag == 0) {
      return twoDigits(localD.inHours.remainder(60));
    } else if (HMSFlag == 1) {
      return twoDigits(localD.inMinutes.remainder(60));
    } else {
      return twoDigits(localD.inSeconds.remainder(60));
    }
  }

  void lapTimer(Duration duration) {
    setState(() {
      lapDurationList.add(duration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 0, bottom: 20.0), // 80.0, bottom: 20.0),
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  // snap: true,
                  // floating: true,
                  title: TimeCardWidget(
                    digits: '${getHMS(HMSFlag: 0, localD: duration)}:'
                        '${getHMS(HMSFlag: 1, localD: duration)}:${getHMS(HMSFlag: 2, localD: duration)}',
                    millisec: duration.inMilliseconds.toString(),
                  ),
                  toolbarHeight: MediaQuery.of(context).size.height * 0.38,
                ),
                // const SliverAppBar(
                //   centerTitle: true,
                //   title: Text('Some Vlue'),
                //   pinned: true,
                //   surfaceTintColor: Colors.white,
                //   elevation: 0.0,
                //   primary: true,
                // ),
                SliverToBoxAdapter(
                  child: ShaderMask(
                    blendMode: BlendMode.dstOut,
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                          colors: <Color>[
                            Colors.transparent,
                            Colors.white.withOpacity(0.8)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.7, 1.0]).createShader(bounds);
                    },
                    child: ListView.separated(
                        itemCount: lapDurationList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 20.0,
                            ),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        // reverse: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 30.0),
                        itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  // color:
                                  //     Theme.of(context).primaryColor.withOpacity(0.1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 1.0,
                                        blurRadius: 0,
                                        offset: const Offset(1.0, 1.0)),
                                    BoxShadow(
                                        color: Colors.grey.shade400,
                                        spreadRadius: 1.0,
                                        blurRadius: 0,
                                        offset: const Offset(1.0, 1.0)),
                                    const BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 3.0,
                                        blurRadius: 1,
                                        offset: Offset(-3.0, -3.0)),
                                    const BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 3.0,
                                        blurRadius: 1,
                                        offset: Offset(-3.0, -3.0))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${lapDurationList.length - index}',
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    '${getHMS(
                                      HMSFlag: 0,
                                      localD: lapDurationList[
                                          (lapDurationList.length - index) - 1],
                                    )}'
                                    ':${getHMS(
                                      HMSFlag: 1,
                                      localD: lapDurationList[
                                          (lapDurationList.length - index) - 1],
                                    )}'
                                    ':${getHMS(
                                      HMSFlag: 2,
                                      localD: lapDurationList[
                                          (lapDurationList.length - index) - 1],
                                    )}',
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (duration.inMilliseconds == 0 || timer!.isActive)
                      ? null
                      : () {
                          stopTimer(true);
                        },
                  child: const Icon(Icons.replay)),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    (timer?.isActive ?? false)
                        ? stopTimer(false)
                        : duration.compareTo(Duration.zero) == 0
                            ? startTimer(null)
                            : startTimer(duration);
                  },
                  child: Icon((timer?.isActive ?? false)
                      ? Icons.pause
                      : Icons.play_arrow)),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: (duration.inMilliseconds == 0 || !timer!.isActive)
                      ? null
                      : () {
                          lapTimer(duration);
                        },
                  child: const Icon(Icons.punch_clock)),
            ],
          ),
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget implements PreferredSizeWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Some Value');
  }

  @override
  Size get preferredSize => const Size(double.infinity, 30);
}
