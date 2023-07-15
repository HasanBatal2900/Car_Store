import 'package:car_store/Compents/Main_draw.dart';
import 'package:car_store/Screens/carGallery.dart';
import 'package:car_store/Screens/categories.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int activeIndex = 0;
  void setIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDraw(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title:
            Text(activeIndex == 0 ? "Choose your categotry" : "Cars Gallrey"),
      ),
      body: activeIndex == 0
          ? const CategoriesScreen()
          : const CarScreen(cars: []),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 6.0,
          currentIndex: activeIndex,
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          showUnselectedLabels: true,
          iconSize: 25,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(
            color: Colors.amber,
          ),
          type: BottomNavigationBarType.shifting,
          onTap: setIndex,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.car_crash,
                color: Colors.cyan,
              ),
              icon: Icon(
                Icons.car_crash,
                color: Colors.white,
              ),
              label: "Categories",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.cyan,
                ),
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.red,
                ),
                label: "Cart"),
          ]),
    );
  }
}
