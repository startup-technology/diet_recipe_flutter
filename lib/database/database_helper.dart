import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  
  static final _databaseName = "diet_recipe.db";
  static final _databaseVersion = 1;

  // DatabaseHelperクラスをシングルトンにするためのコンストラクタ
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // シングルトンにする必要あるのか...？
  // DatabaseHelper._internal();
  // static final DatabaseHelper instance = DatabaseHelper._internal();
  

  // DBにアクセスするためのメソッド
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // 初の場合はDBを作成する
    _database = await _initDatabase();
    return _database;
  }
  
  // データベースを開く。データベースがない場合は作る関数
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory(); // アプリケーション専用のファイルを配置するディレクトリへのパスを返す
    String path = join(documentsDirectory.path, _databaseName); // joinはセパレーターでつなぐ関数
    // pathのDBを開く。なければonCreateの処理がよばれる。onCreateでは_onCreateメソッドを呼び出している
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // DBを作成するメソッド
  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE target_body_weights (id INTEGER PRIMARY KEY autoincrement, body_weight INTEGER NOT NULL)');
    await db.execute('CREATE TABLE current_heights (id INTEGER PRIMARY KEY autoincrement, current_height INTEGER NOT NULL)');
    await db.execute('CREATE TABLE body_weights (id INTEGER PRIMARY KEY autoincrement, input_date datetime NOT NULL, body_weight INTEGER NOT NULL)');
  }
  
  // Helper methods

  // 挿入
  Future<int> insert(Map<String, dynamic> row, String table) async {
    Database db = await instance.database; //DBにアクセスする
    return await db.insert(table, row); //テーブルにマップ型のものを挿入。追加時のrowIDを返り値にする
  }

  // 条件取得(最後)
  Future<List<Map<String, dynamic>>> queryRowLast(String table) async {
    Database db = await instance.database; //DBにアクセスする
    return await db.rawQuery('SELECT * FROM $table ORDER BY ID DESC LIMIT 1');
  }

  // 条件取得
  Future<List<Map<String, dynamic>>> queryRows({String table, String where, String whereArgs}) async {
    Database db = await instance.database; //DBにアクセスする
    // return await db.query(table, where: where, whereArgs: whereArgs);
    return await db.rawQuery('SELECT * FROM $table WHERE $where $whereArgs ORDER BY ID DESC LIMIT 1');
  }

  // 最新の7件の体重を取得
  Future<List<Map<String, dynamic>>> queryLatestweek() async {
    Database db = await instance.database; //DBにアクセスする
    return await db.rawQuery('select * from body_weights ORDER BY ID ASC LIMIT 7');
  }

  // // 全件取得
  // Future<List<Map<String, dynamic>>> queryAllRows() async {
  //   Database db = await instance.database; //DBにアクセスする
  //   return await db.query(table); //全件取得
  // }

  // // データ件数取得
  // Future<int> queryRowCount() async {
  //   Database db = await instance.database; //DBにアクセスする
  //   return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  // }

  // // 更新
  // Future<int> update(Map<String, dynamic> row, String table) async {
  //   Database db = await instance.database; //DBにアクセスする
  //   int id = row[id]; //引数のマップ型のcolumnIDを取得
  //   print([id]);
  //   return await db.update(table, row, where: 'id = ?', whereArgs: [id]);
  // }

  // // 削除
  // Future<int> delete(int id, String table) async {
  //   Database db = await instance.database;
  //   return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  // }
}