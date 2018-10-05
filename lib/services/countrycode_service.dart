import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:uaedialer/models/country.dart';

Future<String> _loadCountriesAsset() async {
  return await rootBundle.loadString('assets/country_codes.json');
}

Future<List<CountryCode>> loadCountryCodes() async {
  String jsonString = await _loadCountriesAsset();
  final jsonResponse = json.decode(jsonString);
  // print(jsonResponse);

  CountriesCodeList countriesCodeList =
      new CountriesCodeList.fromJson(jsonResponse);
  // print("length " + countriesCodeList.codes.length.toString());
  return countriesCodeList.codes;
}
