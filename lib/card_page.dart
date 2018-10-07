import 'package:flutter/material.dart';
import 'utils/constants.dart';
import 'services/countrycode_service.dart';
import 'dart:async';
// import 'package:uae_dialer/services/utils_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils/circle_button.dart';

class CardPage extends StatefulWidget {
  @override
  CardPageState createState() {
    return CardPageState();
  }
}

// final countriesItemsList = await loadCountryCodes();
class CardPageState extends State<CardPage> {
  final _formKey = GlobalKey<FormState>();
  var _stdCodesList = [];
  var _referPractice;
  final _textController = TextEditingController();
  var _details;

  @override
  initState() {
    super.initState();
    updateStoreCardDetails();
    getCountryCodes();
  }

  Future getCountryCodes() async {
    var countryCodesList = await loadCountryCodes();

    print("**** length " + countryCodesList.length.toString());
    setState(() {
      _stdCodesList = countryCodesList;
    });
  }

  Future updateStoreCardDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _details = prefs.getStringList("CARD_DETAILS");
    if (_details != null) {
      print(_details.length);
      print(_details[0]);
      print(_details[1]);
      _textController.text = _details[0];
      _referPractice = _details[1];
    } else
      print("No card details are stored");
  }

  // final buttons =

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: new Padding(
          padding: const EdgeInsets.all(15.0),
          child: new Column(
            children: <Widget>[
              TextFormField(
                controller: _textController,
                keyboardType: TextInputType.number,
                style: new TextStyle(
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                decoration: new InputDecoration(
                    hintText: HING_ENTER_NUMBER,
                    suffixIcon: CircleIconButton(
                      onPressed: () {
                        this.setState(() {
                          _textController.clear();
                        });
                      },
                    )),
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty) {
                    return ERROR_CARD_DETAILS;
                  }
                },
              ),
              new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Column(
                    children: <Widget>[
                      DropdownButton<String>(
                        value: _referPractice,
                        isDense: true,
                        hint: new Text(CONST_SELECT),
                        items: _stdCodesList.map((value) {
                          return new DropdownMenuItem<String>(
                            value: value.dialCode,
                            child: new Text("${value.code} ${value.dialCode}"),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            _referPractice = newValue;
                          });
                        },
                      )
                    ],
                  )),
              new Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10.0),
                  child: new Row(children: <Widget>[
                    RaisedButton(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      textColor: Colors.white,
                      color: Colors.green,
                      child: new Text(BTN_ADD_TEXT),
                      onPressed: () {
                        if (_formKey.currentState.validate() &&
                            _referPractice != null) {
                          _storeCardNumberAndCountryCode(
                              _textController.text.trim(), _referPractice);
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text(SUCCESSFUL_CARD_DETAILS)));
                        } else {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text(ERROR_COUNTRY_CODE)));
                        }
                      },
                    ),
                    RaisedButton(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      textColor: Colors.white,
                      color: Colors.red,
                      child: new Text(BTN_CLEAR_TEXT),
                      onPressed: () {
                        _textController.clear();
                      },
                    )
                  ])),
            ],
          )),
    );
  }
}

_storeCardNumberAndCountryCode(String number, String countryCode) async {
  print(" ${number} code ${countryCode}");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final cardDetails = new List<String>();
  cardDetails.add(number);
  cardDetails.add(countryCode);

  await prefs.setStringList("CARD_DETAILS", cardDetails);
  // var details = prefs.getStringList("CARD_DETAILS");
  // print(details.length);
  // print(details[0]);
  // print(details[1]);
}
