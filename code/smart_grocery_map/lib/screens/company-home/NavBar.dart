import 'package:flutter/material.dart';
import './StoreScreen.dart';
import './UserScreen.dart';

class NavBar extends StatefulWidget {
  NavBar ({Key? key}) : super(key: key);

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int _pageNumIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();
    switch (_pageNumIndex) {
      case 0:
        widget = StoreScreen();
        break;
      case 1:
        widget = UserScreen();
        break;
    }
    return Scaffold(
      bottomNavigationBar: _bottomTab(),
      body: widget,
    );
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _pageNumIndex,
      onTap: (int index) => setState(() => _pageNumIndex = index),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.local_convenience_store_rounded),
          label: ("Store"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: ("User"),
        ),
      ],
    );
  }
}
