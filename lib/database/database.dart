import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:emiratesdial/models/recentCall.dart';

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
    String path = join(documentsDirectory.path, "EmiratesDial.db");
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

  Future<List<RecentCall>> getRecentCallsList() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Recents');
    List<RecentCall> recentCallList = new List();

    for (int i = 0; i < list.length; i++) {
      recentCallList.add(new RecentCall(
          list[i]["id"],
          list[i]["name"],
          list[i]["mobileno"],
          list[i]["mobiletype"],
          list[i]["timestamp"],
          list[i]["countryCode"]));
    }
    recentCallList.sort((y, x) => x.id.compareTo(y.id));
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
    });
  }
}
