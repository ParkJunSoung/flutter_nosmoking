import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class SumPage extends StatelessWidget {
  const SumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('dd:kk:mm:ss').format(now);
    var _toDay = DateTime.now();
    String date = "20210101";

    int difference = int.parse(
        _toDay.difference(DateTime.parse(date)).inDays.toString());
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Text('${difference}',style: TextStyle(fontSize: 60)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('day',style: TextStyle(fontSize: 20)),
              Text('hours',style: TextStyle(fontSize: 20)),
              Text('min',style: TextStyle(fontSize: 20)),
              Text('sec',style: TextStyle(fontSize: 20)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('안피운 담배 개수\n 60개비'),
                  Text('절약된 금액 \n 13,000원'),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
