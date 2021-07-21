import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';


class DatePicker extends StatefulWidget {
  DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  late TextEditingController _controller1;
  late TextEditingController _controller2;

  String _initialValue = '';
  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';
  var now = new DateTime.now().add(Duration(hours: 9));
  var format = 'yyyy-MM-dd HH:mm';



  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'ko_ko';
    _initialValue = DateTime.now().toString();
    _controller1 = TextEditingController(text: DateTime.now().toString());

    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    _controller2 = TextEditingController(text: '$lsHour:$lsMinute');

    _getValue();
  }

  /// This implementation is just to simulate a load data behavior
  /// from a data base sqlite or from a API
  Future<void> _getValue() async {
    await Future.delayed(const Duration(seconds: 3), () {
      setState(() {
          // _initialValue = '2000-10-22 14:30';
        _controller1.text = '2021-09-20 14:30';
        _controller2.text = '17:01';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Form(
              key: _oFormKey,
              child: Column(
                children: <Widget>[
                  DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'yyyy-MM-dd',
                    controller: _controller1,
                    // initialValue: _initialValue,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Icon(Icons.event),
                    ),
                    dateLabelText: '시작 날짜',
                    timeLabelText: "시간",
                    //use24HourFormat: false,
                    //locale: Locale('pt', 'BR'),
                    selectableDayPredicate: (date) {
                      if (date.weekday == 6 || date.weekday == 7) {
                        return false;
                      }
                      return true;
                    },
                    onChanged: (val) => setState(() => _valueChanged1 = val),
                    validator: (val) {
                      setState(() => _valueToValidate1 = val ?? '');
                      return null;
                    },
                    onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '금연 시작 날짜:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 10),
                  SelectableText(_valueChanged1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          final loForm = _oFormKey.currentState;
                          if (loForm?.validate() == true) {
                            loForm?.save();
                          }
                        },
                        child: Text('학인'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          final loForm = _oFormKey.currentState;
                          loForm?.reset();
                          setState(() {
                            _valueChanged1 = '';
                            _valueToValidate1 = '';
                            _valueSaved1 = '';
                          });
                          _controller1.clear();
                        },
                        child: Text('취소'),
                      ),
                    ],
                  ),
                  Text('${DateFormat(format).format(now)}'),
                ],
              ),
            ),
          ),
    );
  }
}

