import 'package:todo_app/tools/hive_repo.dart';

class PlansModel {
  final String id;
  final String name;
  final DateTime time;
  bool isDone = false;
  PlansModel({required this.id, required this.name, required this.time});

  void isDonePlan() {
    isDone = !isDone;
  }
}

class Plans {
  HiveRepo hiveRepo = HiveRepo();
  final List<PlansModel> _plans = HiveRepo().getPlansList;

  List<PlansModel> get plansList => _plans;

  List<PlansModel> todoByDate(DateTime date) {
    return _plans
        .where((element) =>
            element.time.day == date.day &&
            element.time.month == date.month &&
            element.time.year == date.year)
        .toList();
  }

  void addPlans(String planName, DateTime dateTimePlan) {
    _plans.add(
      PlansModel(
          id: "id${_plans.length + 1}", name: planName, time: dateTimePlan),
    );
    hiveRepo.savePlanList(_plans);
  }
}
