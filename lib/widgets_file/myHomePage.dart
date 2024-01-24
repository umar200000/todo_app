import 'package:flutter/material.dart';
import 'package:todo_app/widgets_file/date_time.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
          //elevation: 0,
          centerTitle: true,
        ),
        body: Column(
          children: [
            DateTime(),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("03"),
                    Text("00"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("your plans"),
                    Text(""),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
