import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_builder/timer_builder.dart';

String dateMillisecondsToString(int mills) {
  return DateFormat('yyyyMMdd')
      .format(DateTime.fromMillisecondsSinceEpoch(mills));
}

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  Timer? _timer;
  var date;
  String? dates;

  _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      date = (prefs.getInt('date'));
      dates = (prefs.getString('dates'));

      print(dates);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCounter();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    var due = DateTime.now().add(Duration(hours: 9));
    int sum = 4500;
    var dated = num.parse(dates!);

    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      return Material(
        color: Colors.black,
        child: Column(
          children: [
            Text('금연시작',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Text(
              '${due.difference(DateTime.parse('${dateMillisecondsToString(date)}'))}'
                  .substring(0, 8),
              style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Text(
                  '시',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 60,
                ),
                Text('분',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 55,
                ),
                Text('초',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 10),
                Container(
                    height: 100,
                    width: 180,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      // border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '절약된 금액 \n',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          '${dated * sum} 원',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
                SizedBox(width: 15),
                Container(
                  height: 100,
                  width: 180,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    // image: DecorationImage(
                    //   image: AssetImage("assets/images/black.jpg"),
                    //   fit: BoxFit.cover,
                    // ),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '늘어난수명 \n ',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        '${due.difference(DateTime.parse('${dateMillisecondsToString(date)}'))}'
                            .substring(0, 8),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Container(
                    height: 100,
                    width: 180,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '건강상태',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '😀',
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    )),
                SizedBox(width: 15),
                Container(
                  height: 100,
                  width: 180,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    '목표',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
