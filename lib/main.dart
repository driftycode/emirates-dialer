import 'package:flutter/material.dart';
import 'home.dart';
import 'recents_page.dart';
import 'card_page.dart';
import 'more_page.dart';
import 'more/help_page.dart';
import 'more/aboutus_page.dart';
import 'more/settings.dart';
import 'utils/constants.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'UAE Dialer',
        theme: new ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.black,
            fontFamily: 'Nunito-Regular'),
        home: new Home(),
        routes: {
          // When we navigate to the "/" route, build the FirstScreen Widget
          GO_HOME: (context) => RecentsPage(),
          GO_RECENT: (context) => RecentsPage(),
          // When we navigate to the "/second" route, build the SecondScreen Widget
          GO_CARD: (context) => CardPage(),
          GO_MORE: (context) => MorePage(),
          GO_HELP: (context) => Help(),
          GO_ABOUTUS: (context) => AboutUs(),
          GO_SETTINGS: (context) => Settings(),
        });
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'UAE Dialer',
//       theme: new ThemeData(
//         primarySwatch: Colors.red, accentColor: Colors.black,

//       ),
//       home: DefaultTabController(
//         length: 4,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               tabs: [
//                 Tab(icon: Icon(Icons.restore)),
//                 // Tab(icon: Icon(Icons.favorite)),
//                 Tab(icon: Icon(Icons.card_giftcard)),
//                 Tab(icon: Icon(Icons.bubble_chart))
//               ],
//             ),
//             title: Text('UAE Dialer'),
//           ),
//           body: TabBarView(
//             children: [
//               RecentsPage(),
//               // FavouritesPage(),
//               CardPage(),
//               // ContactsPage(),
//               MorePage(),
//             ],
//           ),
//         ),
//       )//ContactsPage()
//     );
//   }
// }
