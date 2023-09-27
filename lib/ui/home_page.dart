import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newshttp/ui/article_list_page.dart';
import 'package:newshttp/ui/settings_page.dart';

import '../widgets/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageStart();
}

class _HomePageStart extends State<HomePage> {
  int _bottomNavIndex = 0;
  static const String _headlineText = 'headline';
  final List<Widget> _listWidget = const [
    ArticleListPage(),
    SettingsPage(),
  ];

  final List<BottomNavigationBarItem> _bottomNavigationBarItem = [
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.news : Icons.newspaper),
        label: _headlineText),
    BottomNavigationBarItem(
        icon: Icon(Platform.isIOS ? CupertinoIcons.settings : Icons.settings),
        label: _headlineText),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purpleAccent,
        currentIndex: _bottomNavIndex,
        items: _bottomNavigationBarItem,
        onTap: _onBottomNavTapped,
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _bottomNavigationBarItem,
        activeColor: Colors.lightBlue,
      ),
      tabBuilder: (context, index) {
        return _listWidget[index];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
