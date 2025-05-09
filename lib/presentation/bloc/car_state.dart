import 'package:car_rental/data/models/car_model.dart';

abstract class CarState {}

class CarsLoading extends CarState {}

class CarsLoaded extends CarState {
  final List<CarModel> cars;
  CarsLoaded(this.cars);
}

class CarsError extends CarState {
  final String message;
  CarsError(this.message);
}
