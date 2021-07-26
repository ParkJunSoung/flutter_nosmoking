import 'dart:async';

import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';

class DateCount extends StatefulWidget {
  const DateCount({Key? key}) : super(key: key);

  @override
  _DateCountState createState() => _DateCountState();
}

class _DateCountState extends State<DateCount> {
  String countTime = "Loading";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }
  Widget build(BuildContext context) {
    countTime = CountDown().timeLeft(DateTime.parse('20210727'), "Completed");
    return Scaffold(
      appBar: AppBar(
        title: Text('타이머'),
      ),
      body: Center(
        child: Text(countTime),
      ),
    );
  }
}
