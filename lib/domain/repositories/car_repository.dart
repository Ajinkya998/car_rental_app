import 'package:car_rental/data/models/car_model.dart';

abstract class CarRepository {
  Future<List<CarModel>> fetchCars();
}