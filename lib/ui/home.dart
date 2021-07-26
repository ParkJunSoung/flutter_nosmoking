import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day,from.hour);
      to = DateTime(to.year, to.month, to.day,to.hour);
      return (to.difference(from).inMinutes).round();
    }
    final birthday = DateTime(2021, 07, 22, 17 , 50);
    final date2 = DateTime.now();
    final difference = daysBetween(birthday, date2);


    print(difference);
    print(birthday);
    print(date2);
    return Container(
    );
  }
}
