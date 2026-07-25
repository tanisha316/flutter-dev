import 'dart:io';

// Base Class
class Employee {
  String employeeId = "";
  String employeeName = "";
  String department = "";

  void displayEmployeeInfo() {
    print("Employee ID   : $employeeId");
    print("Employee Name : $employeeName");
    print("Department    : $department");
  }
}

// Child Class
class Payroll extends Employee {
  double basicSalary = 0;
  double hra = 0;
  double da = 0;
  double bonus = 0;

  double grossSalary = 0;
  double tax = 0;
  double netSalary = 0;

  void calculateGrossSalary() {
    grossSalary = basicSalary + hra + da + bonus;
  }

  void calculateTax() {
    if (grossSalary > 80000) {
      tax = grossSalary * 0.20;
    } else if (grossSalary > 50000) {
      tax = grossSalary * 0.10;
    } else {
      tax = 0;
    }
  }

  void calculateNetSalary() {
    netSalary = grossSalary - tax;
  }

  void displaySalarySlip() {
    print("\n==========================================");
    print("         EMPLOYEE SALARY SLIP");
    print("==========================================");

    displayEmployeeInfo();

    print("\nBasic Salary : ₹${basicSalary.toStringAsFixed(2)}");
    print("HRA          : ₹${hra.toStringAsFixed(2)}");
    print("DA           : ₹${da.toStringAsFixed(2)}");
    print("Bonus        : ₹${bonus.toStringAsFixed(2)}");

    print("\nGross Salary : ₹${grossSalary.toStringAsFixed(2)}");
    print("Tax          : ₹${tax.toStringAsFixed(2)}");
    print("Net Salary   : ₹${netSalary.toStringAsFixed(2)}");

    print("==========================================");
  }
}

// Second Child Class (Bonus Requirement)
class Manager extends Payroll {
  double performanceIncentive = 0;

  @override
  void calculateGrossSalary() {
    grossSalary =
        basicSalary + hra + da + bonus + performanceIncentive;
  }

  @override
  void displaySalarySlip() {
    print("\n==========================================");
    print("         MANAGER SALARY SLIP");
    print("==========================================");

    displayEmployeeInfo();

    print("\nBasic Salary         : ₹${basicSalary.toStringAsFixed(2)}");
    print("HRA                  : ₹${hra.toStringAsFixed(2)}");
    print("DA                   : ₹${da.toStringAsFixed(2)}");
    print("Bonus                : ₹${bonus.toStringAsFixed(2)}");
    print("Performance Incentive: ₹${performanceIncentive.toStringAsFixed(2)}");

    print("\nGross Salary : ₹${grossSalary.toStringAsFixed(2)}");
    print("Tax          : ₹${tax.toStringAsFixed(2)}");
    print("Net Salary   : ₹${netSalary.toStringAsFixed(2)}");

    print("==========================================");
  }
}

void main() {
  Manager manager = Manager();

  print("Enter Employee ID:");
  manager.employeeId = stdin.readLineSync()!;

  print("Enter Employee Name:");
  manager.employeeName = stdin.readLineSync()!;

  print("Enter Department:");
  manager.department = stdin.readLineSync()!;

  print("Enter Basic Salary:");
  manager.basicSalary = double.parse(stdin.readLineSync()!);

  print("Enter HRA:");
  manager.hra = double.parse(stdin.readLineSync()!);

  print("Enter DA:");
  manager.da = double.parse(stdin.readLineSync()!);

  print("Enter Bonus:");
  manager.bonus = double.parse(stdin.readLineSync()!);

  print("Enter Performance Incentive:");
  manager.performanceIncentive =
      double.parse(stdin.readLineSync()!);

  manager.calculateGrossSalary();
  manager.calculateTax();
  manager.calculateNetSalary();

  manager.displaySalarySlip();
}
