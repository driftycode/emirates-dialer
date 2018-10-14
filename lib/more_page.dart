import 'package:flutter/material.dart';
import 'more/help_page.dart';
import 'more/aboutus_page.dart';
import 'more/settings.dart';
import 'utils/constants.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Get all contacts
    // Get all contacts
    return Scaffold(
        body: ListView(
      children: [
        ListTile(
          onTap: () {
            // Navigator.pushNamed(context, GO_SETTINGS);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Settings()));
          },
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          subtitle: Text('Disable or enable notifications, usage'),
        ),
        ListTile(
            onTap: () {
              // navigate to about
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => AboutUs()));
              Navigator.pushNamed(context, GO_ABOUTUS);
            },
            leading: Icon(Icons.info),
            title: Text('About us'),
            subtitle: Text('Information about other free applications')),
        ListTile(
          onTap: () {
            // navigate to help screen
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Help()));
          },
          leading: Icon(Icons.help),
          title: Text('Help'),
          subtitle: Text('For any kind of support or help'),
        ),
      ],
    ));
  }
}
