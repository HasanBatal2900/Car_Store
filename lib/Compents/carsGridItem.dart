import 'dart:developer';

import 'package:car_store/Data.dart';
import 'package:car_store/Screens/carGallery.dart';
import 'package:car_store/model/car.dart';
import 'package:car_store/model/carCategory.dart';
import 'package:flutter/material.dart';

class CategoryCarItem extends StatelessWidget {
  const CategoryCarItem({super.key, required this.carCategory});
  final CarCategory carCategory;

  List<Car> getFilteredCars(CarCategory category) {
    List<Car> myCars = [];
    for (var i = 1; i < cars.length; i++) {
      final currentCarCat = cars[i].category;
      for (var j = 0; j < currentCarCat.length; j++) {
        if (currentCarCat[j] == category.id) {
          myCars.add(cars[i]);
        }
      }
    }
    log("${myCars.length}\n\n");
    return myCars;
  }

  @override
  Widget build(BuildContext context) {
    bool isGenralCat = carCategory.id == "suv" ||
        carCategory.id == "SuperCar" ||
        carCategory.id == "van" ||
        carCategory.id == "tr";

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return CarScreen(
                  cars: getFilteredCars(carCategory),
                );
              },
              transitionDuration: const Duration(milliseconds: 600),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                animation = CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn);
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ));
      },
      borderRadius: BorderRadius.circular(15.0),
      highlightColor: Colors.pinkAccent,
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !isGenralCat
                ? Image.asset(
                    carCategory.imagePath,
                    height: 100,
                    width: 100,
                  )
                : Text(carCategory.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [
              carCategory.color,
              carCategory.color.withOpacity(0.55),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
