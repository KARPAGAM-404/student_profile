void main() {
  // Student Information
  String name = "Karpagam";
  int age = 18;
  String department = "CSE";
  double mark = 87.5;
  bool isPassed = true;

  // Additional Information
  String rollNumber = "CSE2024001";
  int semester = 3;

  String grade = calculateGrade(mark);

  List<String> subjects = [
    "Dart",
    "Flutter",
    "Data Structures",
    "Database"
  ];

  print("==================================================");
  print("            STUDENT PORTFOLIO");
  print("==================================================");

  print("\n📚 Basic Information");
  print("Name       : $name");
  print("Age        : $age");
  print("Department : $department");
  print("Roll No    : $rollNumber");
  print("Semester   : $semester");

  print("\n📊 Academic Performance");
  print("Mark       : $mark");
  print("Grade      : $grade");
  print("Status     : ${isPassed ? "PASSED" : "FAILED"}");

  print("\n📖 Subjects Enrolled");

  for (String subject in subjects) {
    print("• $subject");
  }

  print("\n📈 Performance Analysis");

  if (mark >= 90) {
    print("Excellent Performance!");
  } else if (mark >= 75) {
    print("Good Performance!");
  } else if (mark >= 60) {
    print("Satisfactory Performance!");
  } else {
    print("Need Improvement!");
  }

  print("\n🔮 Future Prediction");

  if (isPassed && mark >= 80) {
    print("Bright future in $department.");
  } else if (isPassed) {
    print("Keep working hard.");
  } else {
    print("Need more practice.");
  }

  print("\n==================================================");
}

// Grade Calculation Function
String calculateGrade(double mark) {
  if (mark >= 90) {
    return "A+";
  } else if (mark >= 80) {
    return "A";
  } else if (mark >= 70) {
    return "B+";
  } else if (mark >= 60) {
    return "B";
  } else if (mark >= 50) {
    return "C";
  } else if (mark >= 40) {
    return "D";
  } else {
    return "F";
  }
}