import 'package:car_rental/data/models/car_model.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository carRepository;

  GetCars(this.carRepository);

  Future<List<CarModel>> call() async {
    return await carRepository.fetchCars();
  }
}
