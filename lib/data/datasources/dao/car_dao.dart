import 'package:car_park_app/data/datasources/car_database.dart';
import 'package:car_park_app/data/models/car_model.dart';
import 'package:sqflite/sqflite.dart';

class CarDao {
  final CarDatabase dbProvider;

  CarDao([CarDatabase? dbProvider])
      : dbProvider = dbProvider ?? CarDatabase.dbProvider;

  Future<List<CarModel>> getAllCarsParked() async {
    try {
      final db = await dbProvider.database;
      final carMaps = await db.query(
        'cars',
        where: 'checkOutTime IS NULL',
      );

      return carMaps.map((carMap) => CarModel.fromMap(carMap)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> insertCarCheckout({required CarModel car}) async {
    try {
      final db = await dbProvider.database;

      await db.insert('cars', car.toMap(),
          conflictAlgorithm: ConflictAlgorithm.fail);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCarCheckout({required CarModel car}) async {
    try {
      final db = await dbProvider.database;

      await db.update('cars', car.toMap(),
          where: 'carNumber = ?', whereArgs: [car.carNumber]);
    } catch (e) {
      rethrow;
    }
  }
}
