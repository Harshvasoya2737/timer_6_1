import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff1F1F1F),
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.lightBlue,
          size: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20), // Added SizedBox to create space
            ...time.map((e) {
              return Time(
                name: e["name"],
                day: e["day"],
                min: e["min"],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class Time extends StatelessWidget {
  final String? name;
  final String? day;
  final String? min;

  const Time({Key? key, this.name, this.day, this.min}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Container(
        height: 130,
        width: 390,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(name ?? "",
                        style:
                            TextStyle(color: Color(0xff4F4F4F), fontSize: 60)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5),
                      child: Text(min ?? "",
                          style: TextStyle(
                              color: Color(0xff4F4F4F), fontSize: 20)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(day ?? "",
                    style: TextStyle(color: Color(0xff4F4F4F), fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Map> time = [
  {
    "name": "6:00",
    "day": "Once",
    "min": "AM",
  },
  {
    "name": "6:30",
    "day": "Once",
    "min": "AM",
  },
  {
    "name": "7:00",
    "day": "Once",
    "min": "AM",
  },
  {
    "name": "7:30",
    "day": "Once",
    "min": "PM",
  },
  {
    "name": "8:30",
    "day": "Once",
    "min": "PM",
  },
  {
    "name": "9:00",
    "day": "Once",
    "min": "PM",
  }
];
