import 'package:flutter/material.dart';
import './StoreScreen.dart';
import './ShoppingListScreen.dart';
import './MapScreen.dart';
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
        widget = ShoppingListScreen();
        break;
      case 2:
        widget = MapScreen();
        break;
      case 3:
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
          label: ("Stores"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.playlist_add_check_rounded),
          label: ("My List"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_rounded),
          label: ("Map"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: ("User"),
        ),
      ],
    );
  }
}

    /*return new Container(
      padding: EdgeInsets.all(0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton.icon(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new StoreScreen()));
              },
              icon: Icon(Icons.local_convenience_store_rounded),
              label: Text("Store"),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton.icon(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new ShoppingListScreen()));
              },
              icon: Icon(Icons.playlist_add_check_rounded),
              label: Text("My List"),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton.icon(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new MapScreen()));
              },
              icon: Icon(Icons.map_rounded),
              label: Text("Map"),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton.icon(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new UserScreen()));
              },
              icon: Icon(Icons.person),
              label: Text("Person"),
            ),
          ),
        ],
      ),
    );*/