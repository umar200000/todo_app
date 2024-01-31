import 'package:hive/hive.dart';

import '../plans_todo/plans_model.dart';

class HiveRepo {
  final Box _box = Hive.box("plansList");

  savePlanList(List<PlansModel> list) {
    _box.put("list", list);
  }

  getPlanList() {
    List<dynamic> list = _box.get("list", defaultValue: <PlansModel>[]);
    List<PlansModel> list2 = [];
    list.forEach((element) {
      list2.add(element);
    });
    return list2;
  }

  saveCounter(Number number) {
    _box.put("sum", number.b);
  }

  getCounter() {
    return _box.get("sum", defaultValue: Number().b);
  }
}

class Number {
  int b = 10;
}
