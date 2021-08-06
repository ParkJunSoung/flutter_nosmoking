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
          SizedBox(height: 25,),
          Text('전국 금연 클리닉',style: TextStyle(fontSize: 30,color: Colors.white),),
          SizedBox(height: 25,),
          ListView.builder(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.centerlist.length,
            itemBuilder: (BuildContext content, int index) {
              return  Container(
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
                    leading: Text('${list.centerlist[index]}',style: TextStyle(color: Colors.white),) ,
                    title: Text('${list.add[index]}',style: TextStyle(color: Colors.white)),
                    subtitle: Text('${list.number[index]}',style: TextStyle(color: Colors.white)),
                  ),
              );
            },
          ),
        ],
      ),
    );
  }
}
