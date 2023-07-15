import 'package:car_store/Compents/carCard.dart';
import 'package:flutter/material.dart';
import '../model/car.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key, required this.cars});
  final List<Car> cars;

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (cars.isEmpty) {
      content = const Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            "Oh sorry there is no Cars here Try to discoversomething else",
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: cars.length,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14),
        itemBuilder: (context, index) {
          return CarCard(car: cars[index], index: index);
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: const Text("Pick Your Car"),
      ),
      body: content,
    );
  }
}
