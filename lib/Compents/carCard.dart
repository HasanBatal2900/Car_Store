import 'package:car_store/Screens/carDetails.dart';
import 'package:flutter/material.dart';

import '../model/car.dart';

Map<String, String> carsIcon = {
  "bmw": "images/logos/bmwLogo.png",
  "lambo": "images/logos/lamboLogo.png",
  "mazda": "images/logos/mazdaLogoWithoutStr.png",
  "audi": "images/logos/audi_dark_logo.png",
  "merceds": "images/logos/mercedsLogo.png",
};

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car, required this.index});

  final Car car;
  final int index;
  @override
  Widget build(BuildContext context) {
    bool isBmw = car.category[0] == "bmw";
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return CarDetails(car: car);
              },
              transitionDuration: const Duration(milliseconds: 500),
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
      child: Hero(
        tag: car.carName,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              clipBehavior: Clip.hardEdge,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage(car.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      index % 2 == 0
                          ? Colors.cyan.withOpacity(0.6)
                          : Colors.orange.withOpacity(0.6),
                      // Colors.black.withOpacity(0.55),
                      Colors.transparent,
                    ],
                    stops: const [0.1, 0.8],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
            ),
            Positioned(
              top: isBmw ? -20 : 10,
              right: isBmw ? -30 : 2,
              child: Image.asset(
                carsIcon[car.category[0]]!,
                height: isBmw ? 140 : 100,
                width: isBmw ? 140 : 100,
              ),
            ),
            Positioned(
                bottom: 80,
                right: 12,
                child: Text(
                  "${car.category[0].toUpperCase()}|${car.category[1]}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )),
            Positioned(
                bottom: 80,
                left: 10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Row(children: [
                    Icon(Icons.car_crash),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Car\'s Info",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ]),
                )),
            Positioned(
              bottom: 30,
              left: 12,
              right: 12,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Model:${car.carName}",
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Max speed:${car.maxSpeed}Km/h",
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.blueGrey.shade800],
                      stops: const [0.4, 0.9]),
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    Text(
                      "Total Price: ${car.averagePrice.toInt()}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    const Icon(
                      Icons.attach_money_sharp,
                      color: Colors.white,
                      size: 24,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
