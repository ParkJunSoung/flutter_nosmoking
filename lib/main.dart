import 'package:flutter/material.dart';
import 'package:flutter_nosmoking/model/provider.dart';
import 'package:flutter_nosmoking/ui/dropdown_page.dart';
import 'package:flutter_nosmoking/ui/select_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ListProvider>(create: (_) => ListProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: DayPickers(),
        ));
  }
}
