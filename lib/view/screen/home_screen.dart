import 'package:flutter/material.dart';

import '/app/app_locale.dart';
import '../../setting/theme.dart';
import '/view/market/foreign_market_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    ForeignMarketHome(),
    Container(),
    Container(),
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocale.of(context);
    return Scaffold(
      backgroundColor: AppTheme.loginBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 0, left: 10, right: 10),
        child: _pages[_currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.travel_explore),
            label: locale.get('Foreign market'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: locale.get('My Account'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: locale.get('Domestic market'),
          ),
        ],
        currentIndex: _currentPage,
        selectedItemColor: Colors.amber[800],
        onTap: (i) => setState(() => _currentPage = i),
      ),
    );
  }
}
