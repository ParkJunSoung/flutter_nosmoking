import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class ClockWidget extends StatefulWidget {
  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    var due = DateTime.now().add(Duration(hours: 9));

    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      return Material(
        child: Column(
          children: [
            Text('금연시간'),
            Text(
              "${due.difference(DateTime.parse('20210725'))}"
                  .substring(0, 8),
              style: TextStyle(fontSize: 55),
            ),
            Text('시 분 초'),

          ],
        ),
      );
    });
  }
}
