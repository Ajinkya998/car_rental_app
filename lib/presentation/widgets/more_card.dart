import 'package:car_rental/data/models/car_model.dart';
import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final CarModel carModel;
  const MoreCard({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF212020),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Text(carModel.model,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(children: [
              const Icon(Icons.directions_car, color: Colors.white, size: 16),
              const SizedBox(width: 10),
              Text("> ${carModel.distance} km",
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
              const SizedBox(width: 5),
              const Icon(Icons.battery_full, color: Colors.white, size: 16),
              const SizedBox(width: 5),
              Text(carModel.fuelCapacity.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
            ]),
          ]),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24),
        ],
      ),
    );
  }
}
