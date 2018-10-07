import 'package:flutter/material.dart';
import 'package:contact_picker/contact_picker.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:uaedialer/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uaedialer/models/recentCall.dart';

class RecentsPage extends StatefulWidget {
  @override
  _RecentPageState createState() {
    return _RecentPageState();
  }
}

class _RecentPageState extends State<RecentsPage> {
  final ContactPicker _contactPicker = new ContactPicker();
  Contact _contact;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_getRecentcallFromDb();
  }

  // Future<List<RecentCall>> _getRecentcallFromDb() async {
  //   Future<List<RecentCall>> recentCallList;
  //   var dbHelper = DBHelper();
  //   var newCall = RecentCall("test", "00919908693377", "IND",
  //       "17/09/18 06:15:31.497000000 AM", "+91");

  //   dbHelper.saveRecentCall(newCall);

  //   print("Called database to fetch records");
  //   recentCallList = dbHelper.getRecentCallsList();
  //   print(recentCallList);
  //   return recentCallList;
  // }

  Future<List<RecentCall>> _getRecentcallFromDb() async {
    var dbHelper = DBHelper();
    Future<List<RecentCall>> employees = dbHelper.getRecentCallsList();
    return employees;
  }

  @override
  Widget build(BuildContext context) {
    final makeListTile = ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white24))),
          child: Icon(Icons.autorenew, color: Colors.white),
        ),
        title: Text(
          "Introduction to Driving",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(" Intermediate", style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));

    final makeCard = Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile,
      ),
    );

    final makeBody = Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return makeCard;
        },
      ),
    );

    return new Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              Contact contact = await _contactPicker.selectContact();
              print(contact.fullName);
              setState(() {
                _contact = contact;
                print(contact.fullName);
                _showDialogContactDial(context, _contact);
              });
            }),
        body: Builder(
          builder: (context) => new Container(
                padding: new EdgeInsets.all(16.0),
                child: new FutureBuilder<List<RecentCall>>(
                  future: _getRecentcallFromDb(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasData) {
                          return makeBody;
                          // return new ListView.builder(
                          //     itemCount: snapshot.data.length,
                          //     itemBuilder: (context, index) {
                          //       return new Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: <Widget>[
                          //             new Text(snapshot.data[index].name,
                          //                 style: _textStyle(18.0)),
                          //             new Text(snapshot.data[index].mobileNo,
                          //                 style: _textStyle(14.0)),
                          //             new Divider()
                          //           ]);
                          //     });
                        } else if (snapshot.error ||
                            snapshot.data.length == 0) {
                          return new Text("${snapshot.error}");
                        }
                    }

                    // return new Container(
                    //   alignment: AlignmentDirectional.center,
                    //   child: new CircularProgressIndicator(),
                    // );
                  },
                ),
              ),
        ));
  }
}

_textStyle(double fontSize) {
  return new TextStyle(fontWeight: FontWeight.w400, fontSize: fontSize);
}

_storeDialedNumberToDB(BuildContext context, RecentCall callRecord) async {
  DBHelper db = new DBHelper();
  print(callRecord);
  db.saveRecentCall(callRecord);
  print("saved details");
}

Future<Null> _showDialogContactDial(context, Contact contactRecord) async {
  // List<String> number = contactRecord.phoneNumber.number;

  return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext dialogContext) {
      return new AlertDialog(
        title: new Text('Confirm Number'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new TextFormField(
                maxLines: 1,
                decoration: new InputDecoration(hintText: 'Number'),
                keyboardType: TextInputType.number,
                autofocus: true,
                initialValue: contactRecord.phoneNumber.number,
              ),
              //new Text(contactRecord.fullName),
              //new Text(contactRecord.phoneNumber.toString()),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text(
              'Call',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              var url = "tel:9908693377";

              // _launchURL(context, contactRecord.phoneNumber.number,
              //     contactRecord.phoneNumber.label);
              _launchURL(contactRecord.phoneNumber.number,
                  contactRecord.phoneNumber.label);
            },
          ),
          new FlatButton(
            color: Colors.red,
            child: new Text('Close', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

_launchURL(String mobileNumber, String name) async {
  String url = "tel:" + mobileNumber;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// _launchURL(context, String mobileNumber, String name) async {
//   String url = "tel://" + mobileNumber;
//   var timestampCallLog = new DateTime.now().toString();
//   print(timestampCallLog);

//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var details = prefs.getStringList("CARD_DETAILS");
//   if (details != null) {
//     print(details.length);
//     print(details[0]);
//     print(details[1]);
//     if (url != null) {
//       if (url.contains("-")) url = url.replaceAll("-", "");
//       if (url.contains("(")) url = url.replaceAll("(", "");
//       if (url.contains(")")) url = url.replaceAll(")", "");
//     }

//     print(url);

//     // storing call info in database
//     RecentCall recentCall =
//         new RecentCall(name, mobileNumber, "", timestampCallLog, details[1]);
//     _storeDialedNumberToDB(context, recentCall);

//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   } else {
//     print("no card details are saved");
//     Scaffold.of(context)
//         .showSnackBar(SnackBar(content: Text("No card details are saved")));
//   }
// }
