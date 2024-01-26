import 'package:flutter/material.dart';
import 'package:todo_app/widgets_file/date_time.dart';
import 'package:todo_app/widgets_file/plans_list.dart';
import 'package:todo_app/widgets_file/your_plans_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime = DateTime.now();
  List<int> plansIndex = [];

  void chooseCalendar(BuildContext context) {
    showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          dateTime = value;
        });
      }
    });
  }

  void increaseDecreaseDay(bool t) {
    setState(() {
      if (t) {
        dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day + 1);
      } else {
        dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day - 1);
      }
    });
  }

  void checkPlansWork(int value) {
    setState(() {
      if (plansIndex.contains(value)) {
        plansIndex.remove(value);
      } else
        plansIndex.add(value);
    });
  }

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
            DateTime10(
              timeCountroller: chooseCalendar,
              dateTime: dateTime,
              increaseDecreaseDay: increaseDecreaseDay,
            ),
            SizedBox(
              height: 50,
            ),
            YourPlansPage(),
            SizedBox(
              height: 35,
            ),
            PlansList(checkPlans: checkPlansWork, plansController: plansIndex),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
