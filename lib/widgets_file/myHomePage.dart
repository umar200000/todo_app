import 'package:flutter/material.dart';
import 'package:todo_app/plans_todo/add_plans.dart';
import 'package:todo_app/tools/gloibal_hive.dart';
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
  Plans plans = Plans();
  DateTime _dateTime = DateTime.now();

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
      plans
          .todoByDate(_dateTime)
          .firstWhere((element) => element.id == id)
          .isDonePlan();
      hiveRepo.savePlanList1(plans.plans);
    });
  }

  void _deletePlan(String id) {
    setState(() {
      plans.plansList.removeWhere((element) => element.id == id);
      hiveRepo.savePlanList1(plans.plans);
    });
  }

  int get _plansLenght => plans.todoByDate(_dateTime).length;
  int get _donePlans =>
      plans.todoByDate(_dateTime).where((element) => element.isDone).length;

  void todoDateTime(String planName, DateTime planTime) {
    setState(() {
      plans.addPlans(planName, planTime);
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
    plans.plans = hiveRepo.getPlanList1();
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
              planList: plans.todoByDate(_dateTime),
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
