import 'package:car_store/Screens/Tabs.dart';
import 'package:car_store/Screens/categories.dart';
import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          bottomNavigationBarTheme:const BottomNavigationBarThemeData(
            unselectedLabelStyle: TextStyle(
              color: Colors.white,
            ),
            selectedLabelStyle: TextStyle(
                color: Colors.amberAccent, ),
          ),
          scaffoldBackgroundColor: Colors.blueGrey.shade800.withOpacity(0.7)),
      debugShowCheckedModeBanner: false,
      home: const TabsScreen(),
    );
  }
}
