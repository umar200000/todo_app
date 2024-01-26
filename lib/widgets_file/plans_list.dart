import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlansList extends StatelessWidget {
  List<int> plansController;
  final void Function(int a) checkPlans;
  PlansList(
      {super.key, required this.checkPlans, required this.plansController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 4),
            leading: IconButton(
              onPressed: () {
                checkPlans(index);
              },
              icon: plansController.contains(index)
                  ? Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                    )
                  : Icon(
                      Icons.circle_outlined,
                    ),
            ),
            title: Text(
              "Go shopping",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete_forever_rounded,
                size: 20,
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
