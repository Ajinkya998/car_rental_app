import 'package:bloc/bloc.dart';
import 'package:car_rental/domain/usecases/get_cars.dart';
import 'package:car_rental/presentation/bloc/car_events.dart';
import 'package:car_rental/presentation/bloc/car_state.dart';

class CarBloc extends Bloc<CarEvents, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoading()) {
    on<LoadCar>((event, emit) async {
      emit((CarsLoading()));
      try {
        final cars = await getCars.call();
        emit(CarsLoaded(cars));
      } catch (e) {
        emit(CarsError(e.toString()));
      }
    });
  }
}
