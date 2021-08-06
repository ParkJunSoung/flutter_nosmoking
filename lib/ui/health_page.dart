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
          SizedBox(
            height: 25,
          ),
          Text(
            '금연 후 몸의 변화',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          SizedBox(
            height: 25,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.change.length,
            itemBuilder: (BuildContext content, int index) {
              return Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    '${list.change[index]}',
                    style: TextStyle(fontSize: 17, color: Colors.white),
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
