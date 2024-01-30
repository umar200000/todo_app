import 'package:flutter/material.dart';
import 'package:todo_app/plans_todo/plans.dart';
import 'package:todo_app/plans_todo/plans_model.dart';

class PlansList extends StatelessWidget {
  final List<PlansModel> planList;
  final void Function(String id) isDonePlan;
  final void Function(String id) deletePlan;
  PlansList(
      {super.key,
      required this.planList,
      required this.isDonePlan,
      required this.deletePlan});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: planList.length > 0
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Plans10(
                  plan: planList[index],
                  isDonePlan: isDonePlan,
                  deletePlan: deletePlan,
                );
              },
              itemCount: planList.length,
            )
          : Column(
              children: [
                Text(
                  "there isn't any plans",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/sleep.png",
                  width: 160,
                  //fit: BoxFit.cover,
                ),
              ],
            ),
    );
  }
}
