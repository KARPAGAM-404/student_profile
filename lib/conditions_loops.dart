void main() {
  List<String> students = [
    "Karpagam",
    "Priya",
    "Arun",
    "Kumar",
    "Divya"
  ];

  print("Student Names:");
  for (String name in students) {
    print(name);
  }

  Map<String, dynamic> student = {
    "name": "Karpagam",
    "age": 18,
    "department": "CSE"
  };

  print("\nStudent Details:");
  print(student["name"]);
  print(student["age"]);
  print(student["department"]);

  String? optionalName;

  print("\nNullable Value:");
  print(optionalName ?? "No name found");
}