import 'package:car_park_app/data/models/car_model.dart';
import 'package:car_park_app/domain/repositories/car_repository.dart';

class CarUsecase {
  final CarRepository carRepository;

  CarUsecase({required this.carRepository});

  Future<List<CarModel>> getAllCarsUsecase() async {
    return await carRepository.fetchAllCarsCheckedIn();
  }

  Future<void> checkInCarUsecase(CarModel car) => carRepository.checkInCar(car);

  Future<void> checkOutCarUseCase(CarModel car) =>
      carRepository.checkOutAndSaveTime(car);
}
