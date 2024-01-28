import 'package:flutter/material.dart';
import 'package:todo_app/plans_todo/plans_model.dart';

class Plans10 extends StatelessWidget {
  final PlansModel plan;
  final void Function(String id) isDonePlan;
  final void Function(String id) deletePlan;
  const Plans10(
      {super.key,
      required this.plan,
      required this.isDonePlan,
      required this.deletePlan});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: IconButton(
        onPressed: () {
          isDonePlan(plan.id);
        },
        icon: Icon(
          plan.isDone ? Icons.check_circle_outline : Icons.circle_outlined,
          color: plan.isDone ? Colors.green : Colors.grey,
        ),
      ),
      title: Text(
        plan.name,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          decoration:
              plan.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          color: plan.isDone ? Colors.grey : Colors.black,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          deletePlan(plan.id);
        },
        icon: const Icon(
          Icons.delete_forever_rounded,
          size: 20,
        ),
      ),
    );
  }
}
