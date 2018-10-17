import 'package:flutter/material.dart';
import 'more/settings.dart';
import 'utils/constants.dart';
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

class MorePage extends StatelessWidget {
  // email launcher for help screen
  _launchEmail() async {
    const url = 'mailto:hello@driftycode?subject=Help from UAEDialer';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (BuildContext context) => Help()));
            _launchEmail();
          },
          leading: Icon(Icons.help),
          title: Text('Help'),
          subtitle: Text('For any kind of support or help'),
        ),
        ListTile(
          onTap: () {
            LaunchReview.launch(
                androidAppId: "com.facebook.katana", iOSAppId: "284882215");
          },
          leading: Icon(Icons.rate_review),
          title: Text('Rate us'),
          subtitle: Text('Your feedback is valuable to us to improve quality'),
        ),
      ],
    ));
  }
}
