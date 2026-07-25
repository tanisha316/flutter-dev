void main() {
  // Step 1: List of Students
  List<String> students = [
    "Rahul",
    "Priya",
    "Aman",
    "Sneha",
    "Karan"
  ];

  // Step 2: Map of Student Marks
  Map<String, int> marks = {
    "Rahul": 85,
    "Priya": 72,
    "Aman": 91,
    "Sneha": 65,
    "Karan": 38,
  };

  print("=========================================");
  print("STUDENT NAMES USING FOR LOOP");
  print("=========================================");

  // for loop
  for (int i = 0; i < students.length; i++) {
    print(students[i]);
  }

  print("\n=========================================");
  print("STUDENT NAMES USING WHILE LOOP");
  print("=========================================");

  // while loop
  int i = 0;
  while (i < students.length) {
    print(students[i]);
    i++;
  }

  print("\n=========================================");
  print("STUDENT NAMES USING DO-WHILE LOOP");
  print("=========================================");

  // do-while loop
  int j = 0;
  do {
    print(students[j]);
    j++;
  } while (j < students.length);

  print("\n=========================================");
  print("STUDENT NAMES USING FOR-IN LOOP");
  print("=========================================");

  // for-in loop
  for (String student in students) {
    print(student);
  }

  print("\n=========================================");
  print("STUDENT NAMES USING forEach");
  print("=========================================");

  // forEach loop
  students.forEach((student) {
    print(student);
  });

  print("\n=========================================");
  print("        STUDENT GRADE REPORT");
  print("=========================================");

  // Step 4 & Step 5
  for (String student in students) {
    int score = marks[student]!;

    String grade;

    // if-else for Grade
    if (score >= 90) {
      grade = "A+";
    } else if (score >= 80) {
      grade = "A";
    } else if (score >= 70) {
      grade = "B";
    } else if (score >= 60) {
      grade = "C";
    } else if (score >= 40) {
      grade = "D";
    } else {
      grade = "Fail";
    }

    String remarks;

    // switch for Performance
    switch (grade) {
      case "A+":
        remarks = "Outstanding";
        break;
      case "A":
        remarks = "Excellent";
        break;
      case "B":
        remarks = "Very Good";
        break;
      case "C":
        remarks = "Good";
        break;
      case "D":
        remarks = "Needs Improvement";
        break;
      default:
        remarks = "Failed";
    }

    print("Student : $student");
    print("Marks   : $score");
    print("Grade   : $grade");
    print("Remarks : $remarks");
    print("-----------------------------------------");
  }

  print("=========================================");
}
