import 'package:flutter/material.dart';

class MainDraw extends StatelessWidget {
  const MainDraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 300,
        child: Column(
          children: [
            DrawerHeader(
              child: Text("Choose Settings"),
            )
          ],
        ),
      ),
    );
  }
}
