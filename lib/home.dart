import 'package:flutter/material.dart';
// import 'placeholder_widget.dart';
// import 'card_widget.dart';
import 'more_page.dart';
// import 'favourites_page.dart';
import 'recents_page.dart';
import 'card_page.dart';
import 'database/database.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    DBHelper db = new DBHelper();
    db.initDb();
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [RecentsPage(), CardPage(), MorePage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UAE Dialer'),
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Recents'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.restore),
            title: Text('Card'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart), title: Text('Settings'))
        ],
      ),
    );
  }
}
