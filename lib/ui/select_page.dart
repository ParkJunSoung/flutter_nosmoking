import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nosmoking/ui/dropdown_page.dart';
import 'package:flutter_nosmoking/ui/navigation_bar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DayPickers extends StatefulWidget {
  @override
  _DayPickersState createState() => _DayPickersState();
}

class _DayPickersState extends State<DayPickers> {
  List<String> _numbers = ["0.5", "1.0", "1.5", "2.0", "2.5", "3.0"];
  DateTime currentDate = DateTime.now();



  Future<void> _selectDate(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
    await prefs.setInt('date', pickedDate!.millisecondsSinceEpoch);

    print(prefs.getInt('date'));
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/b.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () => _selectDate(context),
                  child: Text('금연시작날짜',style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {},
                    child: Text('${currentDate.toString().substring(0, 10)}',style: TextStyle(fontSize: 20),)),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('흡연량(갑 기준)',style: TextStyle(color: Colors.white,fontSize: 20),),
                SizedBox(width: 50,),
                SizedBox(width:55,height: 40,child: DropDownPage()),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Home(),
                  ),
                      (route) => false,
                );
              },
              child: Text(
                '시작하기',
                style: TextStyle(color: Colors.white,fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
