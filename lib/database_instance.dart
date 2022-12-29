import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:uas_sqflite/mahasiswa_model.dart';

class DatabaseInstance {
  final String _dbName = 'list_mhs.db';
  final int _databaseVersion = 1;

  // Table Mahasiswa
  final String _tableListMahasiswa = 'list_mahasiswa_baru';
  final String id = 'id';
  final String name = 'name';
  final String nim = 'nim';
  final String alamat = 'alamat';
  final String phone = 'phone';
  final String jenisKelamin = 'jenis_kelamin';
  final File image = File('image');

  Database? _database;

  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableListMahasiswa (
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $name TEXT NOT NULL,
        $nim TEXT NOT NULL,
        $alamat TEXT NOT NULL,
        $phone TEXT NOT NULL,
        $jenisKelamin TEXT NOT NULL,
        $image BLOB NOT NULL
      )
    ''');
  }

  Future<List<MahasiswaModel>?> all() async {
    final data = await _database?.query(_tableListMahasiswa);
    List<MahasiswaModel>? result =
        data?.map((e) => MahasiswaModel.fromJson(e)).toList();
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(_tableListMahasiswa, row);
    return query;
  }

  Future<int> update(int value, Map<String, dynamic> row) async {
    final query = await _database!
        .update(_tableListMahasiswa, row, where: '$id = ?', whereArgs: [value]);
    return query;
  }

  Future delete(int value) async {
    final query = await _database!
        .delete(_tableListMahasiswa, where: '$id = ?', whereArgs: [value]);
    return query;
  }
}
