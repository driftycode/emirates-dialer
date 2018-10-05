class CountriesCodeList {
  final List<CountryCode> codes;

  CountriesCodeList({this.codes});

  // factory CountriesCodeList.fromJson(Map<String, dynamic> parsedJson) {
  //   return CountryCode(
  //       // name: parsedJson['name'],
  //       // dial_code: parsedJson['dial_code'],
  //       // code: parsedJson['code']);
  //       codes: CountryCode.fromJson(parsedJson['data']);
  // }

  factory CountriesCodeList.fromJson(List<dynamic> parsedJson) {
    List<CountryCode> codesList = new List<CountryCode>();

    codesList = parsedJson.map((i) => CountryCode.fromJson(i)).toList();

    //List<CountryCode> codesList = new List<CountryCode>.from(countrycodesFromJson);

    return new CountriesCodeList(
      codes: codesList,
    );
  }
}

class CountryCode {
  String name;
  String dialCode;
  String code;

  CountryCode({this.name, this.dialCode, this.code});

  factory CountryCode.fromJson(Map<String, dynamic> parsedJson) {
    return CountryCode(
        name: parsedJson['name'],
        dialCode: parsedJson['dial_code'],
        code: parsedJson['code']);
  }
}
