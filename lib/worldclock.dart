import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Duration duration;

  @override
  void initState() {
    super.initState();
    DateTime dateTime = DateTime.now();
    duration = Duration(
      seconds: dateTime.second,
      minutes: dateTime.minute,
      hours: dateTime.hour,
      days: dateTime.year,
    );
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xff1F1F1F),
        onPressed: () {}, // You need to specify an onPressed function here
        child: Icon(
          Icons.add,
          color: Colors.lightBlue,
          size: 40,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 360, top: 40),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 120, left: 30),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${duration.inHours % 12}".padLeft(2, "0"),
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  TextSpan(
                    text: ":",
                    style: TextStyle(fontSize: 50),
                  ),
                  TextSpan(
                    text: "${duration.inMinutes % 60}".padLeft(2, "0"),
                    style: TextStyle(fontSize: 50),
                  ),
                  TextSpan(
                    text: ":",
                    style: TextStyle(fontSize: 50),
                  ),
                  TextSpan(
                    text: "${duration.inSeconds % 60}".padLeft(2, "0"),
                    style: TextStyle(fontSize: 50),
                  ),
                  TextSpan(
                    text: "${DateFormat(' a').format(DateTime.now())}\n",
                    style: TextStyle(fontSize: 30),
                  ),
                  TextSpan(
                    text:
                        "Current: | ${DateFormat('yMMMMd').format(DateTime.now())}",
                    style: TextStyle(color: Color(0xff4F4F4F), fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              height: 130,
              width: 390,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "New Delhi",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 115, top: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "${DateFormat('jm').format(DateTime.now())}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 32),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Same as local time",
                          style:
                              TextStyle(color: Color(0xff4F4F4F), fontSize: 20),
                        ),
                        SizedBox(width: 45),
                        Text(
                          "${DateFormat('yMMMMd').format(DateTime.now())}",
                          style:
                              TextStyle(color: Color(0xff4F4F4F), fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 130,
              width: 390,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Delhi",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 165, top: 10),
                              child: Column(
                                children: [
                                  Text(
                                    "${DateFormat('jm').format(DateTime.now())}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 32),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Same as local time",
                          style:
                          TextStyle(color: Color(0xff4F4F4F), fontSize: 20),
                        ),
                        SizedBox(width: 45),
                        Text(
                          "${DateFormat('yMMMMd').format(DateTime.now())}",
                          style:
                          TextStyle(color: Color(0xff4F4F4F), fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void timer() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        duration = duration + Duration(seconds: 1);
      });
      timer();
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: Clock(),
  ));
}
