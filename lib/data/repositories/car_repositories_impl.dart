import 'package:car_rental/data/datasources/firebase_car_data_sources.dart';
import 'package:car_rental/data/models/car_model.dart';
import 'package:car_rental/domain/repositories/car_repository.dart';

class CarRepositoriesImpl implements CarRepository {
  final FirebaseCarDataSources dataSources;

  CarRepositoriesImpl(this.dataSources);

  @override
  Future<List<CarModel>> fetchCars() {
    return dataSources.getCars();
  }
}