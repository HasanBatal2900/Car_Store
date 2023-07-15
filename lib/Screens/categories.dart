import 'package:car_store/Compents/carsGridItem.dart';
import 'package:car_store/Data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.3),
        itemBuilder: (context, index) {
          return CategoryCarItem(carCategory: categories[index]);
        },
      ),
    );
  }
}
