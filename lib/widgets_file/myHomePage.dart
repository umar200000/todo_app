import 'package:flutter/material.dart';
import 'package:todo_app/plans_todo/add_plans.dart';
import 'package:todo_app/widgets_file/date_time.dart';
import 'package:todo_app/widgets_file/plans_list.dart';
import 'package:todo_app/widgets_file/your_plans_page.dart';

import '../plans_todo/plans_model.dart';
import '../tools/hive_repo.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HiveRepo hiveRepo = HiveRepo();
  DateTime _dateTime = DateTime.now();
  Plans _plansList = Plans();
  int a = 0;
  Number number = Number();

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
      number.b++;
      hiveRepo.saveCounter(number);
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
      _plansList
          .todoByDate(_dateTime)
          .firstWhere((element) => element.id == id)
          .isDonePlan();
    });
    // hiveRepo.savePlanList(_plansList.plansList);
  }

  void _deletePlan(String id) {
    setState(() {
      _plansList.plansList.removeWhere((element) => element.id == id);
      // hiveRepo.savePlanList(_plansList.plansList);
    });
  }

  int get _plansLenght => _plansList.todoByDate(_dateTime).length;
  int get _donePlans => _plansList
      .todoByDate(_dateTime)
      .where((element) => element.isDone)
      .length;

  void todoDateTime(String planName, DateTime planTime) {
    setState(() {
      _plansList.addPlans(planName, planTime);
    });
  }

  void _addPlans(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return AddPlansPage(todoDateTime);
        });
  }

  @override
  void initState() {
    // number.b = hiveRepo.getCounter();
    // print(number.b);
    // print(hiveRepo.getCounter());
    // List<PlansModel> list = hiveRepo.getPlanList();
    // list.forEach((element) {
    //   print(element.name);
    // });
    _plansList.plans = hiveRepo.getPlanList();
    print(2);

    super.initState();
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
              planList: _plansList.todoByDate(_dateTime),
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
