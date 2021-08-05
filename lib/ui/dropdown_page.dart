import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({Key? key}) : super(key: key);

  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  @override
  Widget build(BuildContext context) {
    const List category_map = [
      {"code": "1", "title": "1월"},
      {"code": "2", "title": "2월"},
      {"code": "3", "title": "3월"},
    ];
    String? _category;
    String? _categoryResult;
    return Material(
      child: SizedBox(
        height: 100,
        width: 200,
        child: DropDownFormField(
          hintText: '카테고리를 선택해주세요.',
          value: _category != null ? _category : '',
          onSaved: (value) {
            setState(() {
              _category = value;
            });
          },
          onChanged: (value) {
            setState(() {
              _category = value;
              _categoryResult = _category;
            });
          },
          dataSource: category_map,
          textField: 'title',
          valueField: 'code',
        ),
      ),
    );
  }
}
