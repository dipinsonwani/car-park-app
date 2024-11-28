import 'package:car_park_app/data/models/car_model.dart';

abstract class CarRepository {
  Future<List<CarModel>> fetchAllCarsCheckedIn();

  Future<void> checkInCar(CarModel car);

  Future<void> checkOutAndSaveTime(CarModel car);
}
