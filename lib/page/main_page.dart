import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mono_sample/layout_type.dart';
import 'package:mono_sample/page/home_page.dart';
import 'package:mono_sample/page/profile_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _layoutType = LayoutType.home;
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildTabBar(),
      body: Container(
        child: _buildPage(),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey[200]),
          ),
        ),
      ),
    );
  }

  CupertinoTabBar _buildTabBar() {
    return CupertinoTabBar(
//      type: BottomNavigationBarType.fixed,
      activeColor: Theme.of(context).primaryColor,
      currentIndex: _currentIndex,
      items: [
        _buildNavigationItem(LayoutType.home),
        _buildNavigationItem(LayoutType.search),
        _buildNavigationItem(LayoutType.add),
        _buildNavigationItem(LayoutType.alert),
        _buildNavigationItem(LayoutType.profile),
      ],
      onTap: _onSelectTab,
    );
  }

  BottomNavigationBarItem _buildNavigationItem(LayoutType type) {
    return BottomNavigationBarItem(
        title: Text(
          '',
          style: TextStyle(fontSize: 0.0),
        ),
        icon: Icon(_icon(type)));
  }

  IconData _icon(LayoutType type) {
    switch (type) {
      case LayoutType.home:
        return Icons.home;
      case LayoutType.search:
        return Icons.search;
      case LayoutType.add:
        return Icons.add_a_photo;
      case LayoutType.alert:
        return Icons.favorite_border;
      case LayoutType.profile:
        return Icons.person_outline;
      default:
        return Icons.add;
    }
  }

  Widget _buildPage() {
    switch (_layoutType) {
      case LayoutType.home:
        return HomePage();
      case LayoutType.profile:
        return ProfilePage();
      default:
        return Text(_layoutType.toString());
    }
  }

  void _onSelectTab(int index) {
    switch (index) {
      case 0:
        _onLayoutSelected(LayoutType.home, index);
        break;
      case 1:
        _onLayoutSelected(LayoutType.search, index);
        break;
      case 2:
        _onLayoutSelected(LayoutType.add, index);
        break;
      case 3:
        _onLayoutSelected(LayoutType.alert, index);
        break;
      case 4:
        _onLayoutSelected(LayoutType.profile, index);
        break;
    }
  }

  void _onLayoutSelected(LayoutType type, int index) {
    setState(() {
      _layoutType = type;
      _currentIndex = index;
    });
  }
}
