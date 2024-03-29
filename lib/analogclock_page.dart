import 'dart:math';

import 'package:flutter/material.dart';

class ClockUI extends StatefulWidget {
  const ClockUI({super.key});

  @override
  State<ClockUI> createState() => _ClockUIState();
}

class _ClockUIState extends State<ClockUI> {
  Duration duration = Duration();

  @override
  void initState() {
    super.initState();
    DateTime dateTime = DateTime.now();
    duration = Duration(
        seconds: dateTime.second,
        minutes: dateTime.minute,
        hours: dateTime.hour);
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Container(
                height: 250,
                width: 250,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xff4DB6AC), width: 20),
                    bottom: BorderSide(color: Color(0xff4DB6AC), width: 20),
                    left: BorderSide(color: Colors.white30, width: 20),
                    right: BorderSide(color: Colors.white30, width: 20),
                  ),
                  color: Color(0xff1F1F1F),
                ),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Text(
                          "|",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          "|",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                    Transform.rotate(
                      angle: 1 / 6 * pi,
                      child: Column(
                        children: [
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: 2 / 6 * pi,
                      child: Column(
                        children: [
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: 3 / 6 * pi,
                      child: Column(
                        children: [
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: 4 / 6 * pi,
                      child: Column(
                        children: [
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: 5 / 6 * pi,
                      child: Column(
                        children: [
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            "|",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: duration.inHours / 6 * pi,
                      child: Container(
                        width: 6,
                        height: 200,
                        margin: EdgeInsets.only(bottom: 100, top: 50),
                        color: Colors.white,
                      ),
                    ),
                    Transform.rotate(
                      angle: duration.inMinutes / 30 * pi,
                      child: Container(
                        width: 4,
                        height: 200,
                        margin: EdgeInsets.only(bottom: 100, top: 20),
                        color: Colors.white,
                      ),
                    ),
                    Transform.rotate(
                      angle: duration.inSeconds / 30 * pi,
                      child: Container(
                        width: 2,
                        height: 200,
                        margin: EdgeInsets.only(bottom: 100, top: 5),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Indian Standard Time (IST)",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  void timer() async {
    await Future.delayed(Duration(seconds: 1), () {});
    duration = Duration(seconds: duration.inSeconds + 1);
    timer();
    setState(() {});
  }
}
