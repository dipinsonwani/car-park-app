import 'package:car_park_app/data/repositories/car_repository_impl.dart';
import 'package:car_park_app/domain/repositories/car_repository.dart';
import 'package:car_park_app/domain/usecases/car_usecase.dart';
import 'package:car_park_app/presentation/blocs/car_bloc.dart';
import 'package:car_park_app/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    CarRepository carRepository = CarRepositoryImpl();
    CarUsecase carUsecase = CarUsecase(carRepository: carRepository);
    return BlocProvider(
      create: (context) => CarCubit(carUsecase),
      child: HomePage(),
    );
  }
}
