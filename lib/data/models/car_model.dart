import 'dart:convert';

class CarModel {
  final String carNumber;
  final DateTime checkInTime;
  final DateTime? checkOutTime;

  CarModel(
    this.carNumber,
    this.checkInTime,
    this.checkOutTime,
  );

  CarModel copyWith({
    String? carNumber,
    DateTime? checkInTime,
    DateTime? checkOutTime,
  }) {
    return CarModel(
      carNumber ?? this.carNumber,
      checkInTime ?? this.checkInTime,
      checkOutTime ?? this.checkOutTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carNumber': carNumber,
      'checkInTime': checkInTime.millisecondsSinceEpoch,
      'checkOutTime': checkOutTime?.millisecondsSinceEpoch,
    };
  }

  factory CarModel.fromMap(Map<String, dynamic> map) {
    return CarModel(
      map['carNumber'] as String,
      DateTime.fromMillisecondsSinceEpoch(map['checkInTime'] as int),
      map['checkOutTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['checkOutTime'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CarModel.fromJson(String source) =>
      CarModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CarModel(carNumber: $carNumber, checkInTime: $checkInTime, checkOutTime: $checkOutTime)';

  @override
  bool operator ==(covariant CarModel other) {
    if (identical(this, other)) return true;

    return other.carNumber == carNumber &&
        other.checkInTime == checkInTime &&
        other.checkOutTime == checkOutTime;
  }

  @override
  int get hashCode =>
      carNumber.hashCode ^ checkInTime.hashCode ^ checkOutTime.hashCode;
}
