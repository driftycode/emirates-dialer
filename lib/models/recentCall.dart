class RecentCall {
  String name;
  String mobileNo;
  String numberType;
  String timestamp;
  String countryCode;

  RecentCall(this.name, this.mobileNo, this.numberType, this.timestamp,
      this.countryCode);

  RecentCall.fromMap(Map map) {
    name = map[name];
    mobileNo = map[mobileNo];
    numberType = map[numberType];
    timestamp = map[timestamp];
    countryCode = map[countryCode];
  }
}
