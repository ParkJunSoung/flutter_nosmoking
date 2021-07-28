import 'dart:async';
import 'package:flutter/material.dart';
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
        color: Colors.grey[200],
        child: Column(
          children: [
            Text('금연시간', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            Text(
              '${due.difference(DateTime.parse('20210725'))}'.substring(0, 8),
              style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                SizedBox(
                  width: 120,
                ),
                Text(
                  '시',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 60,
                ),
                Text('분', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 55,
                ),
                Text('초', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.black),
                    ),
                    child: Text('💰\n 절약된 금액 \n 54,000원',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
                SizedBox(width: 10),
                Container(
                  height: 100,
                  width: 180,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/black.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.black),
                  ),
                  child: Text('🌱\n 늘어난 수명 \n  11:44:31',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Text('건강상태',style: TextStyle(fontSize: 20,),textAlign: TextAlign.center,),
                        Text('🥴',style: TextStyle(fontSize: 40),),
                      ],
                    )),
                SizedBox(width: 10),
                Container(
                  height: 100,
                  width: 180,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.black),
                  ),
                  child: Text('💎\n 목표',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                ),
              ],
            ),
            Container(
              height: 140,
              width: 380,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: Colors.black),
              ),
              child: Text('광고',style: TextStyle(fontSize: 80),textAlign: TextAlign.center,),
            ),
          ],
        ),
      );
    });
  }
}
