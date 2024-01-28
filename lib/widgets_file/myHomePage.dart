import 'package:flutter/material.dart';
import 'package:todo_app/widgets_file/date_time.dart';
import 'package:todo_app/widgets_file/plans_list.dart';
import 'package:todo_app/widgets_file/your_plans_page.dart';

import '../plans_todo/plans_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _dateTime = DateTime.now();
  List<PlansModel> _plansList = Plans().plansList;

  void _chooseCalendar(BuildContext context) {
    showDatePicker(
      initialDate: DateTime.now(),
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value != null) {
        setState(() {
          _dateTime = value;
        });
      }
    });
  }

  void _increaseDecreaseDay(bool t) {
    setState(() {
      if (t) {
        _dateTime =
            DateTime(_dateTime.year, _dateTime.month, _dateTime.day + 1);
      } else {
        _dateTime =
            DateTime(_dateTime.year, _dateTime.month, _dateTime.day - 1);
      }
    });
  }

  void _isDonePlan(String id) {
    setState(() {
      _plansList.firstWhere((element) => element.id == id).isDonePlan();
    });
  }

  void _deletePlan(String id) {
    setState(() {
      _plansList.removeWhere((element) => element.id == id);
    });
  }

  int get _plansLenght => _plansList.length;
  int get _donePlans => _plansList.where((element) => element.isDone).length;

  void _addPlans(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Plan Day is not chosen..."),
                      TextButton(
                        onPressed: () {},
                        child: Text("Choose Day"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "CANCEL",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Enter"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
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
              timeCountroller: _chooseCalendar,
              dateTime: _dateTime,
              increaseDecreaseDay: _increaseDecreaseDay,
            ),
            SizedBox(
              height: 50,
            ),
            YourPlansPage(_plansLenght, _donePlans),
            SizedBox(
              height: 35,
            ),
            PlansList(
              planList: _plansList,
              isDonePlan: _isDonePlan,
              deletePlan: _deletePlan,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _addPlans(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
