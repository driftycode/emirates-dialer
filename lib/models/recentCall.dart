class RecentCall {
  int id;
  String name;
  String mobileNo;
  String numberType;
  String timestamp;
  String countryCode;

  RecentCall(this.id, this.name, this.mobileNo, this.numberType, this.timestamp,
      this.countryCode);

  RecentCall.fromMap(Map map) {
    id = map[id];
    name = map[name];
    mobileNo = map[mobileNo];
    numberType = map[numberType];
    timestamp = map[timestamp];
    countryCode = map[countryCode];
  }
}
