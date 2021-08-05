import 'package:flutter/material.dart';
import 'package:flutter_nosmoking/model/provider.dart';
import 'package:provider/provider.dart';

class HealthPage extends StatelessWidget {
  const HealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.read<ListProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            '금연 후 몸의 변화',
            style: TextStyle(fontSize: 30),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.change.length,
            itemBuilder: (BuildContext content, int index) {
              return Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: list.ColorList[index]),
                ),
                child: ListTile(
                  title: Text(
                    '${list.change[index]}',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
