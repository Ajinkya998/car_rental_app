import 'package:car_rental/data/models/car_model.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});

  final List<CarModel> cars = [
    CarModel(
        model: "Fortuner GR",
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    CarModel(
        model: "Fortuner GR",
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    CarModel(
        model: "Fortuner GR",
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
    CarModel(
        model: "Fortuner GR",
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Choose Your Car"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: cars.length,
        separatorBuilder: (_, __) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          return CarCard(carModel: cars[index]);
        },
      ),
    );
  }
}
