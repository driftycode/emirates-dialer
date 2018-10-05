import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uaedialer/models/recentCall.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  //Creating a database with name test.dn in your directory
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "uaedialer.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    print("DB created" + theDb.getVersion().toString());
    print("Path ");
    return theDb;
  }

  // Creating a table name Employee with fields
  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Recents(id INTEGER PRIMARY KEY, name TEXT, mobileno TEXT, mobiletype TEXT, timestamp TEXT, countryCode TEXT )");
    print("Created tables");
  }

  // Retrieving recent calls from Recents Tables
  // Future<List<RecentCall>> getRecentCallsList() async {
  //   var dbClient = await db;
  //   List<Map> list;
  //   try {
  //     list = await dbClient.rawQuery('SELECT * FROM Recents');
  //     print("List Length " + list.length.toString());
  //   } on DatabaseException catch (e) {
  //     print(e.isSyntaxError());
  //   }

  //   List<RecentCall> recentCalls = new List();
  //   if (list != null && list.length > 0) {
  //     for (int i = 0; i < list.length; i++) {
  //       recentCalls.add(new RecentCall(
  //           list[i]["name"],
  //           list[i]["mobileno"],
  //           list[i]["mobiletype"],
  //           list[i]["timestamp"],
  //           list[i]["countryCode"]));
  //     }
  //     print("length of the recent list" + recentCalls.length.toString());
  //   }
  //   return recentCalls;
  // }

  Future<List<RecentCall>> getRecentCallsList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Recents');
    List<RecentCall> recentCallList = new List();
    for (int i = 0; i < list.length; i++) {
      recentCallList.add(new RecentCall(list[i]["name"], list[i]["mobileno"],
          list[i]["mobiletype"], list[i]["timestamp"], list[i]["countryCode"]));
    }
    print(recentCallList.length);
    return recentCallList;
  }

  void saveRecentCall(recentCall) async {
    var dbClient = await db;
    print("Inserting record into db");
    print(recentCall);

    await dbClient.transaction((txn) async {
      return await txn.rawInsert(
          'INSERT INTO Recents(name, mobileno, mobiletype, timestamp, countryCode) VALUES(' +
              '\'' +
              recentCall.name +
              '\'' +
              ',' +
              '\'' +
              recentCall.mobileNo +
              '\'' +
              ',' +
              '\'' +
              recentCall.numberType +
              '\'' +
              ',' +
              '\'' +
              recentCall.timestamp +
              '\'' +
              ',' +
              '\'' +
              recentCall.countryCode +
              '\'' +
              ')');
      // 'INSERT INTO Recents(id, name, mobileno, mobiletype, timestamp, countryCode) VALUES((?,?,?,?,?,?)',
      // [
      //   1212,
      //   recentCall.name,
      //   recentCall.mobileNo,
      //   recentCall.numberType,
      //   recentCall.timestamp,
      //   recentCall.countryCode
      // ]);
    });
  }
}
