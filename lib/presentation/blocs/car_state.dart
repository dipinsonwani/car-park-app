// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:car_park_app/data/models/car_model.dart';

class CarState {
  final List<CarModel> carList;
  final bool loading;
  final String? error;
  CarState({
    required this.carList,
    required this.loading,
    this.error,
  });

  CarState copyWith({
    List<CarModel>? carList,
    bool? loading,
    String? error,
  }) {
    return CarState(
      carList: carList ?? this.carList,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carList': carList.map((x) => x.toMap()).toList(),
      'loading': loading,
      'error': error,
    };
  }

  factory CarState.fromMap(Map<String, dynamic> map) {
    return CarState(
      carList: List<CarModel>.from(
        (map['carList'] as List<int>).map<CarModel>(
          (x) => CarModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      loading: map['loading'] as bool,
      error: map['error'] != null ? map['error'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarState.fromJson(String source) =>
      CarState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CarState(carList: $carList, loading: $loading, error: $error)';

  @override
  bool operator ==(covariant CarState other) {
    if (identical(this, other)) return true;

    return listEquals(other.carList, carList) &&
        other.loading == loading &&
        other.error == error;
  }

  @override
  int get hashCode => carList.hashCode ^ loading.hashCode ^ error.hashCode;
}
