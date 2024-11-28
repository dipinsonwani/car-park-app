// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:car_park_app/data/datasources/table/car_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CarDatabase {
  static final CarDatabase dbProvider = CarDatabase();

  static const databaseName = "cars.db";

  static const databaseVersion = 1;

  Database? _database;

  Future<Database> get database async {
    _database ??= await createDatabase();

    return _database!;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, databaseName);

    var database =
        await openDatabase(path, version: databaseVersion, onCreate: initDB);
    return database;
  }

  void initDB(Database database, int version) async {
    CarTable.createTable(database, version);
  }
}
