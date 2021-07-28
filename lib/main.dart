import 'package:flutter/material.dart';
import 'package:flutter_nosmoking/ui/day_pickers.dart';
import 'package:flutter_nosmoking/ui/navigation_bar.dart';
import 'package:flutter_nosmoking/model/provider.dart';
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
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home(),
        )
    );
  }
}