import 'package:flutter/material.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key, required this.content, required this.title});

  final String title;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.blueGrey.shade800),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [content],
          ),
        ],
      ),
    );
  }
}
