import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'worldclock.dart';
import 'stopwatch.dart';
import 'analogclock_page.dart';

void main() {
  runApp(AlarmApp());
}

class AlarmApp extends StatefulWidget {
  const AlarmApp({Key? key});

  @override
  State<AlarmApp> createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [Homepage(), Clock(), Watch(),ClockUI()];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff141414),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24), // Adjust the height as needed
            Row(
              children: [
                SizedBox(width: 65),
                IconButton(
                  icon: Icon(Icons.alarm, size: 30),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
                SizedBox(width: 30),
                IconButton(
                  icon: Icon(Icons.watch_later_outlined, size: 30),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1; // Move to the "World clock" page
                    });
                  },
                ),
                SizedBox(width: 30),
                IconButton(
                  icon: Icon(Icons.timer_sharp, size: 30),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2; // Move to the "Stopwatch" page
                    });
                  },
                ),
                SizedBox(width: 30),
                IconButton(
                  icon: Icon(Icons.watch, size: 30),
                  onPressed: () {
                    setState(() {
                      _currentIndex = 3; // Move to the "Stopwatch" page
                    });
                  },
                ),
                SizedBox(width: 3),
                Padding(
                  padding: const EdgeInsets.only(left: 10,top: 5),
                  child: Icon(
                    Icons.more_vert,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
            Expanded(
              child: _pages[_currentIndex],
            ),
          ],
        ),
      ),
    );
  }
}
