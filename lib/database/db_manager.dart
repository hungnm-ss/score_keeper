import 'package:score_keeper/data/model/user.dart';
import 'package:sqflite/sqflite.dart';
import '../utils/log_util.dart';
import 'db_constants.dart';

class DbManager {
  String tag = 'DbManager';

  DbManager._privateConstructor() {
    //
  }

  static final DbManager _instance = DbManager._privateConstructor();

  static DbManager get instance => _instance;

  Database? db;

  openDb() async {
    LoggerUtil.log('openDb', tag: tag);
    try {
      db ??= await openDatabase(
        'data.db',
        version: 1,
        onCreate: (Database db, int version) async {
          final batch = db.batch();
          _queryCreateTables(batch);
          await batch.commit();
        },
      );
    } catch (_) {
      db = null;
    }
  }

  void _queryCreateTables(Batch batch) {
    batch.execute('''
          create table $userTable (
          $columnUserId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          $columnUserName TEXT NOT NULL,
          $columnUserScore REAL NOT NULL,
          $columnUserColor TEXT NOT NULL
          )
          ''');
  }

  closeDb() async {
    LoggerUtil.log('closeDb', tag: tag);
    try {
      await db?.close();
    } catch (_) {}
    db = null;
  }

  Future<String> insertUser({
    required User user,
  }) async {
    await openDb();

    final Map<String, dynamic> data = {
      columnUserName: user.name,
      columnUserScore: user.score,
      columnUserColor: user.color,
    };

    int result = 0;
    try {
      result = await db?.insert(userTable, data) ?? 0;
      LoggerUtil.log('insert user : $data - result: $result', tag: tag);
    } catch (exc) {
      LoggerUtil.log('insert user error: $exc');
    } finally {
      await closeDb();
    }

    return "$result";
  }

  Future<List<User>> getUsers() async {
    await openDb();
    List<Map>? maps = [];
    try {
      maps = await db?.query(
        userTable,
        orderBy: '`$columnUserScore` ASC',
      );
    } catch (_) {}

    List<User> results = [];
    if (maps != null) {
      for (final item in maps) {
        final wallet = User.fromDbMap(item);
        results.add(wallet);
      }
    }
    await closeDb();
    return results;
  }

  Future<List<User>> sortUsers(bool isASC) async {
    await openDb();
    List<Map>? maps = [];
    try {
      maps = await db?.query(
        userTable,
        orderBy: '`$columnUserScore` ${isASC ? "ASC" : "DESC"}',
      );
    } catch (_) {}

    List<User> results = [];
    if (maps != null) {
      for (final item in maps) {
        final wallet = User.fromDbMap(item);
        results.add(wallet);
      }
    }
    await closeDb();
    return results;
  }

  Future<int> deleteUser(User user) async {
    await openDb();
    var result = 0;
    String query = 'DELETE FROM $userTable WHERE $columnUserId=?';
    try {
      result = await db?.rawDelete(query, [user.id]) ?? 0;
    } catch (_) {}
    await closeDb();
    return result;
  }

  Future<bool> updateUser({
    required User user,
  }) async {
    await openDb();

    final Map<String, dynamic> data = {
      columnUserName: user.name,
      columnUserScore: user.score,
      columnUserColor: user.color,
    };
    const where = '$columnUserId = ?';
    final whereArgs = [user.id];
    try {
      final result =
          await db?.update(userTable, data, where: where, whereArgs: whereArgs);
      return result != null && result > 0;
    } catch (e) {
      LoggerUtil.log('error update user: $e');
    } finally {
      await closeDb();
    }
    return false;
  }
}
