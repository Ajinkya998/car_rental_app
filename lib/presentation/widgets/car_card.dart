import 'package:car_rental/data/models/car_model.dart';
import 'package:car_rental/presentation/pages/car_details_screen.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final CarModel carModel;
  const CarCard({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CarDetailScreen(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset("assets/car_image.png", height: 120),
            const SizedBox(height: 5),
            Text(carModel.model,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/gps.png'),
                        const SizedBox(width: 5),
                        Text('${carModel.distance.toStringAsFixed(0)}KM')
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Image.asset('assets/pump.png'),
                        const SizedBox(width: 5),
                        Text('${carModel.fuelCapacity.toStringAsFixed(0)}L')
                      ],
                    ),
                  ],
                ),
                Text(
                  "\$${carModel.pricePerHour.toStringAsFixed(2)}/hr",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
