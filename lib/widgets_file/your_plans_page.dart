import 'package:flutter/material.dart';

class YourPlansPage extends StatelessWidget {
  final int plansLenght;
  final int plansDone;
  YourPlansPage(this.plansLenght, this.plansDone, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                plansLenght < 10 ? "0$plansLenght" : plansLenght.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                plansDone < 10 ? "0$plansDone" : plansDone.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("all your plans"),
              Text("plans that you have done"),
            ],
          ),
        ],
      ),
    );
  }
}
