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
  final List<PlansModel> _plans = [
    PlansModel(id: "id1", name: "Go shopping", time: DateTime.now()),
    PlansModel(id: "id2", name: "Do Flutter homework", time: DateTime.now()),
    PlansModel(id: "id3", name: "Clean house", time: DateTime.now()),
  ];

  List<PlansModel> get plansList => _plans;
}
