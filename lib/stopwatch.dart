import 'dart:async';
import 'package:flutter/material.dart';

class Watch extends StatefulWidget {
  const Watch({Key? key}) : super(key: key);

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  String hourString = "00", minString = "00", secString = "00";
  int hours = 0, mins = 0, secs = 0;
  bool isTimerRunning = false, isReset = false;
  late Timer timer;
  List<String> lapTimes = [];

  @override
  void startTimer() {
    setState(() {
      isTimerRunning = true;
    });
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      startSecond();
    });
  }

  void startSecond() {
    setState(() {
      if (secs < 60) {
        secs++;
        secString = secs.toString().padLeft(2, '0');
      } else {
        startSecondMin();
      }
    });
  }

  void startSecondMin() {
    setState(() {
      if (secs < 60) {
        secs = 0;
        secString = "00";
        mins++;
        minString = mins.toString().padLeft(2, '0');
      } else {
        startSecondHour();
      }
    });
  }

  void startSecondHour() {
    setState(() {
      secs = 0;
      mins = 0;
      secString = "00";
      minString = "00";
      hours++;
      hourString = hours.toString().padLeft(2, '0');
    });
  }

  void pauseTimer() {
    timer.cancel();
    setState(() {
      isTimerRunning = false;
    });
    isReset = checkValues();
  }

  void refresh() {
    timer.cancel();
    setState(() {
      secs = 0;
      mins = 0;
      hours = 0;
      secString = "00";
      minString = "00";
      hourString = "00";
      isReset = false;
      lapTimes.clear();
    });
  }

  void addLap() {
    setState(() {
      lapTimes.add("$hourString:$minString:$secString");
    });
  }

  bool checkValues() {
    return secs != 0 || mins != 0 || hours != 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 135),
            child: FloatingActionButton(
              shape: CircleBorder(),
              backgroundColor: Color(0xff1F1F1F),
              onPressed: addLap,
              child: Icon(Icons.flag, color: Colors.lightBlue),
            ),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            shape: CircleBorder(),
            backgroundColor: Color(0xff1F1F1F),
            onPressed: () {
              if (isTimerRunning) {
                pauseTimer();
              } else {
                startTimer();
              }
            },
            child: Icon(isTimerRunning ? Icons.stop : Icons.play_arrow,
                color: Colors.lightBlue),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "${hourString}".padLeft(2, "0"),
                              style:
                              TextStyle(color: Colors.white, fontSize: 50),
                            ),
                            TextSpan(
                              text: ":",
                              style:
                              TextStyle(color: Colors.white, fontSize: 50),
                            ),
                            TextSpan(
                              text: "${minString}".padLeft(2, "0"),
                              style:
                              TextStyle(color: Colors.white, fontSize: 50),
                            ),
                            TextSpan(
                              text: ".",
                              style:
                              TextStyle(color: Colors.white, fontSize: 50),
                            ),
                            TextSpan(
                              text: "${secString}".padLeft(2, "0"),
                              style:
                              TextStyle(color: Colors.white, fontSize: 50),
                            ),
                          ]),
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: lapTimes
                              .map(
                                (lap) => Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, bottom: 20),
                              child: Text(
                                lap,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                            ),
                          )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 350, left: 190),
                  child: isReset
                      ? InkWell(
                    onTap: () {
                      refresh();
                    },
                    child: Icon(
                      Icons.refresh,
                      color: Colors.lightBlue,
                      size: 30,
                    ),
                  )
                      : SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
