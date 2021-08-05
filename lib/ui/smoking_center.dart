import 'package:flutter/material.dart';
import 'package:flutter_nosmoking/model/provider.dart';
import 'package:provider/provider.dart';

class SmokingCenter extends StatelessWidget {
  const SmokingCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.read<ListProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('전국 금연 클리닉',style: TextStyle(fontSize: 30),),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.centerlist.length,
            itemBuilder: (BuildContext content, int index) {
              return  Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: ListTile(
                        leading: Text('${list.centerlist[index]}') ,
                        title: Text('${list.add[index]}'),
                        subtitle: Text('${list.number[index]}'),
                      ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
