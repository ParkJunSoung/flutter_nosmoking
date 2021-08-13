import 'package:flutter/material.dart';
import 'package:flutter_nosmoking/model/provider.dart';
import 'package:provider/provider.dart';

class QuotesPage extends StatelessWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = context.read<ListProvider>();
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.quotes.length,
            itemBuilder: (BuildContext content, int index) {
              return Container(
                constraints: BoxConstraints(
                  minHeight: 50, //minimum height
                  minWidth: 100,
                ),
                // minimum width
                margin: EdgeInsets.all(10),
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                  title: Text('${list.quotes[index]}'),
                  subtitle: Text('${list.quotesPerson[index]}'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
