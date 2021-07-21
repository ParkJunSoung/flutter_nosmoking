import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    int daysBetween(DateTime from, DateTime to) {
      from = DateTime(from.year, from.month, from.day,from.hour);
      to = DateTime(to.year, to.month, to.day,to.hour);
      return (to.difference(from).inHours / 24).round();
    }

    //the birthday's date
    final birthday = DateTime(2021, 09, 15, 04, 45);
    final date2 = DateTime.now().add(Duration(hours: 9))
    ;
    final difference = daysBetween(birthday, date2);
    var format = 'yyyy-MM-dd HH'
        ':mm';
    print(difference);
    print(birthday);
    print(date2);
    return Container(
    );
  }
}
