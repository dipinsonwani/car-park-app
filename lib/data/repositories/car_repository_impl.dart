import 'package:car_park_app/data/datasources/dao/car_dao.dart';
import 'package:car_park_app/data/models/car_model.dart';
import 'package:car_park_app/domain/repositories/car_repository.dart';

class CarRepositoryImpl extends CarRepository {
  final CarDao carDao;

  CarRepositoryImpl([CarDao? carDao]) : carDao = carDao ?? CarDao();

  @override
  Future<void> checkInCar(CarModel car) async =>
      await carDao.insertCarCheckout(car: car);

  @override
  Future<void> checkOutAndSaveTime(CarModel car) async =>
      await carDao.updateCarCheckout(car: car);

  @override
  Future<List<CarModel>> fetchAllCarsCheckedIn() async =>
      await carDao.getAllCarsParked();
}
