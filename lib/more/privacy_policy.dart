import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dcLogo = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/img_privacy_policy.png'),
        ),
      ),
    );

    final privacyPolicyText = Padding(
        padding: EdgeInsets.all(16.0),
        child: new RichText(
          text: TextSpan(
            text:
                'We will treat your personal information as confidential and all the recharge card information will be stored on your device. We may store the device model information for bug analysis purpose but doen`t use for any advertisement purpose.',
            style: TextStyle(color: Colors.black, fontSize: 14.0),
          ),
        ));

    final privacyPolicy = Padding(
        padding: EdgeInsets.all(15.0),
        child: new Container(
            child: new Column(children: <Widget>[privacyPolicyText])));

    final bodyScroll = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[dcLogo, privacyPolicy],
            ),
          ),
        );
      },
    );

    return new Scaffold(
        appBar: new AppBar(title: Text('Privacy Policy')), body: bodyScroll);
  }
}
