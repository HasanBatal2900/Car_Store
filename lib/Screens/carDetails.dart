import 'package:car_store/Compents/infoContainer.dart';
import 'package:car_store/model/car.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({super.key, required this.car});
  final Car car;
  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  Map<priceRange, IconData> priceIconCar = {
    priceRange.economic: Icons.leaderboard_rounded,
    priceRange.sport: Icons.emoji_events_sharp,
    priceRange.luxuriy: Icons.auto_awesome,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          elevation: 6.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          backgroundColor: Colors.red,
          child: const Center(
            child: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          title: Text(
            "${widget.car.carName}",
            style: const TextStyle(fontFamily: "bruno"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: widget.car.carName,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    image: DecorationImage(
                      image: AssetImage(
                        widget.car.imagePath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.speed_rounded,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Full Description of Car",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 90,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    children: [
                      InfoContainer(
                          content: Text("${widget.car.maxSpeed} Km per Hour"),
                          title: "MAX SPEED"),
                      InfoContainer(
                          content: Text("${widget.car.acceleration}"),
                          title: "Acceleration".toUpperCase()),
                      InfoContainer(
                          content: Text("${widget.car.hourseAmount} Hourse"),
                          title: "Total Hourses".toUpperCase()),
                      InfoContainer(
                          content:
                              Text("${widget.car.type.name.toUpperCase()}"),
                          title: "TYPE"),
                      InfoContainer(
                          content: Row(children: [
                            Text("${widget.car.price.name}".toUpperCase()),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(priceIconCar[widget.car.price])
                          ]),
                          title: "CLASS"),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Other Details :",
                style: TextStyle(
                  fontFamily: "bruno",
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  ...widget.car.fullDescription.map(
                    (text) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7.0, horizontal: 12),
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
