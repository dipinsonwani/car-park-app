import 'package:sqflite/sqflite.dart';

class CarTable {
  static void createTable(Database database, int version) async {
    await database.execute(
        "CREATE TABLE cars(carNumber VARCHAR PRIMARY KEY, checkInTime DATETIME NOT NULL, checkOutTime DATETIME);");
  }
}
