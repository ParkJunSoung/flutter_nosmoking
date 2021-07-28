import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_nosmoking/ui/health_page.dart';
import 'package:flutter_nosmoking/ui/main_home_page.dart';
import 'package:flutter_nosmoking/ui/quotes_page.dart';
import 'package:flutter_nosmoking/ui/smoking_center.dart';



int _selectedIndex = 0;
List<Widget> _widgetOptions = <Widget>[
  ClockWidget(),
  QuotesPage(),
  HealthPage(),
  SmokingCenter(),
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('🚭',style: TextStyle(fontSize: 30,fontFamily: 'Jua-Regular',),)),
          backgroundColor: Colors.grey[200],
          toolbarHeight: 50,
        ),
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 75.0,
          items: <Widget>[
            Icon(Icons.home, size: 25),
            Icon(Icons.home, size: 25),
            Icon(Icons.home, size: 25),
            Icon(Icons.home, size: 25),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(

          color: Colors.grey[100],
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      );
  }
}
