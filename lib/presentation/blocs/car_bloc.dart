import 'package:bloc/bloc.dart';
import 'package:car_park_app/data/models/car_model.dart';
import 'package:car_park_app/domain/usecases/car_usecase.dart';
import 'package:car_park_app/presentation/blocs/car_state.dart';

class CarCubit extends Cubit<CarState> {
  final CarUsecase carUsecase;
  CarCubit(this.carUsecase) : super(CarState(carList: [], loading: false));

  Future<void> fetchAllCheckedInCars() async {
    try {
      emit(state.copyWith(loading: true));
      final list = await carUsecase.getAllCarsUsecase();
      emit(state.copyWith(carList: list));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> checkInCar(CarModel car) async {
    try {
      await carUsecase.checkInCarUsecase(car);

      fetchAllCheckedInCars();
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> checkOutCar(CarModel car) async {
    try {
      await carUsecase.checkOutCarUseCase(car);

      fetchAllCheckedInCars();
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
