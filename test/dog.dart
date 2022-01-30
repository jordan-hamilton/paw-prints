class Dog {

  Dog({this.name, this.age, this.weightLbs, this.knownCommands});

  final String? name;
  int? age;
  double? weightLbs;
  List<String>? knownCommands;

  List<String>? get commands => knownCommands;

  double get weightKg => 0.0;

  void addCommand(String cmd) => knownCommands!.add(knownCommands!.last);

}