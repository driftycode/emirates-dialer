import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // email launcher for help screen
    _launchEmail() async {
      const url =
          "mailto:hello@driftycode.com;nbadiganti@gmail.com?subject=Project%20enquiry%20from%20UAEDialer";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    final dcLogo = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/images/app_logo.png'),
        ),
      ),
    );

    final aboutus1 = Padding(
        padding: EdgeInsets.all(15.0),
        child: new Text(
            'Our mission is very simple; to be a company that our customers love working with, and that our employees love working for.',
            style:
                TextStyle(color: Colors.black, fontSize: 20.0, height: 0.9)));

    final aboutus2 = Padding(
        padding: EdgeInsets.all(16.0),
        child: new RichText(
          text: TextSpan(
            text: 'We deliver the best digital products for both ',
            style: TextStyle(color: Colors.black, fontSize: 16.0),
            children: <TextSpan>[
              TextSpan(
                  text: 'iOS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 16.0)),
              TextSpan(
                  text: ' (iPhone and iPad) ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0)),
              TextSpan(
                  text: 'and Android',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 16.0)),
              TextSpan(
                  text: ' (phone and tablet), ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.0)),
              TextSpan(
                  text:
                      'In fact, our clients are so happy with our service that they often collaborate with us on multiple mobile app development projects over many years.',
                  style: TextStyle(color: Colors.black, fontSize: 16.0)),
            ],
          ),
        ));

    // final contactUs = new Container(

    // )

    final contactBtn = new RaisedButton(
      child: const Text(
        'Email us',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.red,
      elevation: 4.0,
      splashColor: Colors.red,
      onPressed: () {
        _launchEmail();
      },
    );

    final aboutUs = Padding(
        padding: EdgeInsets.all(15.0),
        child: new Container(
            child: new Column(
                children: <Widget>[aboutus1, aboutus2, contactBtn])));

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white70,
        ]),
      ),
      child: Column(
        children: <Widget>[dcLogo, aboutUs],
      ),
    );

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
              children: <Widget>[dcLogo, aboutUs],
            ),
          ),
        );
      },
    );

    return new Scaffold(
        appBar: new AppBar(title: Text('About us')), body: bodyScroll);
  }
}
