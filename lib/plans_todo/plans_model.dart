import 'package:todo_app/tools/gloibal_hive.dart';

class PlansModel {
  final String id;
  final String name;
  final DateTime time;
  bool isDone;
  PlansModel(
      {required this.id,
      required this.name,
      required this.time,
      this.isDone = false});

  void isDonePlan() {
    isDone = !isDone;
  }

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "name": name,
      "time": time.millisecondsSinceEpoch,
      "isDone": isDone
    };
  }

  static PlansModel fromJSON(Map<String, dynamic> value) {
    return PlansModel(
      id: value["id"],
      name: value["name"],
      time: DateTime.fromMillisecondsSinceEpoch(value["time"]),
      isDone: value["isDone"],
    );
  }
}

class Plans {
  // static HiveRepo hiveRepo = HiveRepo();
  List<PlansModel> plans = [];

  List<PlansModel> get plansList => plans;

  List<PlansModel> todoByDate(DateTime date) {
    return plans
        .where((element) =>
            element.time.day == date.day &&
            element.time.month == date.month &&
            element.time.year == date.year)
        .toList();
  }

  void addPlans(String planName, DateTime dateTimePlan) {
    plans.add(
      PlansModel(
          id: "id${plans.length + 1}", name: planName, time: dateTimePlan),
    );
    // List<String> list = [];
    // plans.forEach((element) {
    //   list.add(
    //       "${element.id}#${element.name}#${element.time}#${element.isDone}");
    // });
    hiveRepo.savePlanList1(plans);
  }
}
