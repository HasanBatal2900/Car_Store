enum priceRange {
  economic,
  sport,
  luxuriy,
}

enum typeWheel {
  backWheel,
  frontWheel,
  fourthWeel,
}

class Car {
  Car(
      {required this.imagePath,
      required this.carName,
      required this.category,
      required this.maxSpeed,
      required,
      required this.acceleration,
      required this.fullDescription,
      required this.price,
      required this.type,
      required this.minSpeed,
      required this.averagePrice,
      required this.hourseAmount});
  String carName;
  int maxSpeed;
  int minSpeed;
  List<String> category;
  List<String> fullDescription; //مواصفات السياراة
  String acceleration; // التسارع 40km pre hour
  typeWheel type;
  priceRange price;
  double averagePrice;
  int hourseAmount;
  String imagePath;
}
