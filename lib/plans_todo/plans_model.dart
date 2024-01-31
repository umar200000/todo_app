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
  List<PlansModel> plans = [];
  setList(List<PlansModel> list) {
    plans = list;
  }

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

    hiveRepo.savePlanList(plans);
    List<PlansModel> list = hiveRepo.getPlanList();
    list.forEach((element) {
      print(element.name);
    });
    // Number number = Number();
    // number.b = 1;
    // hiveRepo.saveCounter(number);
    print("hive ishlayabdi");

    // HiveRepo().getPlansList().forEach((element) {
    //   print(element.name);
    // });
  }
}
