import 'package:flutter/material.dart';
import 'home.dart';
import 'recents_page.dart';
import 'card_page.dart';
import 'more_page.dart';
import 'more/help_page.dart';
import 'more/aboutus_page.dart';
import 'more/settings.dart';
import 'utils/constants.dart';
import 'package:splashscreen/splashscreen.dart';
import 'more/privacy_policy.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new SplashScreen(
            seconds: 3,
            navigateAfterSeconds: new AfterSplash(),
            title: new Text('Welcome to Emirates Dial'),
            image: new Image.asset('assets/images/app_logo.png'),
            backgroundColor: Colors.white,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100.0,
            loaderColor: Colors.red));
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Emirates Dial',
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
          GO_PRIVACY: (context) => PrivacyPolicy()
        });
  }
}
