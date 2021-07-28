import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DayPickers extends StatefulWidget {
  @override
  _DayPickersState createState() => _DayPickersState();
}
class _DayPickersState extends State<DayPickers> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<String> _numbers = ["0.5", "1.0", "1.5", "2.0", "2.5", "3.0"];

     DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(currentDate.toString().substring(0,10)),
              RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select date'),
              ),
              Text(''),
            ],
          ),
        ),
    );
  }
}


