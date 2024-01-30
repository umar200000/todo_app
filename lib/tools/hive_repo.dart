import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../plans_todo/plans_model.dart';

class HiveRepo {
  final Box _box = Hive.box("plansList");

  savePlanList(List<PlansModel> list) {
    _box.put("plans", list);
  }

  get getPlansList => _box.get("plans", defaultValue: <PlansModel>[]);
}
