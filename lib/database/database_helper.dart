import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../data/menu_info.dart';
import '../data/user_info.dart';

class DatabaseHelper {
  Database? _database;

  static final DatabaseHelper _singleton = DatabaseHelper._instance();

  factory DatabaseHelper() => _singleton;

  DatabaseHelper._instance() {
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'db.db');
    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load('assets/database/db.db');
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(path).writeAsBytes(bytes, flush: true);
    }

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
      create table IF NOT EXISTS MOCK_USER_INFO (
        id INT,
        first_name VARCHAR(50),
        last_name VARCHAR(50),
        email VARCHAR(50),
        gender VARCHAR(50),
        ip_address VARCHAR(20),
        company VARCHAR(50)
      )
      ''');

        db.execute('''
      create table IF NOT EXISTS MOCK_MENU (
        id INT,
        menu_name VARCHAR(50)
      )
      ''');
      },
    );
  }

  Future<List<MenuInfo>?> selectMenuInfo() async {
    final List<Map<String, dynamic>> result = await _database!.query(
      'MOCK_MENU',
    );
    return List.generate(result.length, (index) {
      return MenuInfo.fromMap(result[index]);
    });
  }

  Future<List<UserInfo>?> selectUserInfo() async {
    final List<Map<String, dynamic>> result = await _database!.query(
      'MOCK_USER_INFO',
      orderBy: 'last_name, first_name, ip_address',
    );
    return List.generate(result.length, (index) {
      return UserInfo.fromMap(result[index]);
    });
  }

  Future<void> closeDataBase() async {
    if (_database != null) {
      _database?.close();
    }
  }
}
