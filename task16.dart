import 'package:flutter/material.dart';

void main() {
  runApp(const StudentPortalApp());
}

class StudentPortalApp extends StatelessWidget {
  const StudentPortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Student Information Portal",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const StudentPortalScreen(),
    );
  }
}

class StudentPortalScreen extends StatelessWidget {
  const StudentPortalScreen({super.key});

  void showStudentActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Student Actions",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const Divider(),

              actionTile(context, Icons.email, "Send Email"),
              actionTile(context, Icons.call, "Call Student"),
              actionTile(context, Icons.location_on, "View Address"),
              actionTile(context, Icons.share, "Share Profile"),
              actionTile(context, Icons.download, "Download Marksheet"),

              ListTile(
                leading: const Icon(Icons.close, color: Colors.red),
                title: const Text("Close"),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  ListTile actionTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$title Successfully!"),
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: "UNDO",
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }

  Widget infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18),

          const SizedBox(width: 12),

          Expanded(
            flex: 2,
            child: SelectableText(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          Expanded(
            flex: 3,
            child: SelectableText(
              value,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget marksTable() {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: const [
        TableRow(
          decoration: BoxDecoration(color: Colors.deepPurple),
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Subject",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Max",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Obtained",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        TableRow(children: [
          Padding(
              padding: EdgeInsets.all(8), child: Text("Mathematics")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("100")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("95")),
        ]),
        TableRow(children: [
          Padding(
              padding: EdgeInsets.all(8), child: Text("Science")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("100")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("90")),
        ]),
        TableRow(children: [
          Padding(
              padding: EdgeInsets.all(8), child: Text("English")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("100")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("88")),
        ]),
        TableRow(children: [
          Padding(
              padding: EdgeInsets.all(8), child: Text("Computer")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("100")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("98")),
        ]),
        TableRow(children: [
          Padding(
              padding: EdgeInsets.all(8), child: Text("Hindi")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("100")),
          Padding(
              padding: EdgeInsets.all(8), child: Text("85")),
        ]),
      ],
    );
  }

  Widget summaryCard(IconData icon, String title, String value) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: Colors.deepPurple),
              const SizedBox(height: 5),
              Text(title),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Information Portal"),
        backgroundColor: Colors.deepPurple,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Row(
              children: [
                Icon(Icons.account_circle,
                    size: 35, color: Colors.deepPurple),
                SizedBox(width: 10),
                Text(
                  "Student Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            infoRow(Icons.person, "Student Name", "Rahul Sharma"),
            infoRow(Icons.email, "Email", "rahul@gmail.com"),
            infoRow(Icons.phone, "Mobile", "+91 9876543210"),
            infoRow(Icons.badge, "Roll Number", "CS202501"),
            infoRow(Icons.language, "College Website",
                "www.fluttercollege.com"),

            const SizedBox(height: 25),

            const Row(
              children: [
                Icon(Icons.table_chart,
                    color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  "Student Marksheet",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            const SizedBox(height: 10),

            marksTable(),

            const SizedBox(height: 20),

            Row(
              children: [
                summaryCard(Icons.assignment,
                    "Total Marks", "456 / 500"),
                summaryCard(Icons.percent,
                    "Percentage", "91.2%"),
                summaryCard(Icons.star,
                    "Grade", "A+"),
              ],
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.menu),
                label: const Text("Show Student Actions"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                onPressed: () {
                  showStudentActions(context);
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}