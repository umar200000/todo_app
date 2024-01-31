import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:todo_app/plans_todo/plans_model.dart';

class HiveRepo {
  final Box _box = Hive.box("plansList");

  savePlanList1(List<PlansModel> list) {
    final List<Map<String, dynamic>> res = [];

    for (final plan in list) {
      res.add(plan.toJSON());
    }
    [
      {"id": 213, "name": "asda", "time": 3242423453, "isDone": false}
    ];
    '[{"id": 213, "name": "asda", "time": 3242423453, "isDone": false}]';
    _box.put("list", jsonEncode(res));
  }

  List<PlansModel> getPlanList1() {
    final String str = _box.get("list", defaultValue: "");
    final List<PlansModel> res = [];
    if (str.isNotEmpty) {
      final List<dynamic> json = jsonDecode(str);

      for (final elem in json) {
        res.add(PlansModel.fromJSON(elem));
      }
    }
    return res;
  }
}
