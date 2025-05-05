import 'package:car_rental/data/models/car_model.dart';
import 'package:car_rental/presentation/pages/map_details_screen.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:car_rental/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';

class CarDetailScreen extends StatefulWidget {
  final CarModel carModel;
  const CarDetailScreen({super.key, required this.carModel});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(
        () {
          setState(() {});
        },
      );
    _controller!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(Icons.info_outline), Text(" Information")],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(carModel: widget.carModel),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const Column(children: [
                      CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/user.png')),
                      SizedBox(height: 10),
                      Text("Jane Cooper",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("\$4,253", style: TextStyle(color: Colors.grey)),
                    ]),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapDetailsScreen(
                            car: widget.carModel
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          child:
                              Image.asset("assets/maps.png", fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                MoreCard(
                    carModel: widget.carModel,),
                MoreCard(
                    carModel: widget.carModel),
                MoreCard(
                    carModel: widget.carModel),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
