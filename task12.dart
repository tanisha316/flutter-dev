import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserPreferences(),
    );
  }
}

class UserPreferences extends StatefulWidget {
  const UserPreferences({super.key});

  @override
  State<UserPreferences> createState() => _UserPreferencesState();
}

class _UserPreferencesState extends State<UserPreferences> {
  bool notifications = true;
  bool acceptedTerms = true;

  int gender = 1;
  double fontSize = 20;

  int selectedTheme = 1; // 0 = Light, 1 = Dark
  int currentStep = 1;

  String selectedInterest = "Flutter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Preferences"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Switch
            const Text(
              "Enable Notifications",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SwitchListTile(
              value: notifications,
              activeColor: Colors.deepPurple,
              title: Text(
                notifications ? "Notifications Enabled" : "Notifications Disabled",
              ),
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),

            const Divider(),

            // Toggle Buttons
            const Text(
              "Choose Theme",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ToggleButtons(
              borderRadius: BorderRadius.circular(10),
              isSelected: [
                selectedTheme == 0,
                selectedTheme == 1,
              ],
              onPressed: (index) {
                setState(() {
                  selectedTheme = index;
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text("☀ Light"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text("🌙 Dark"),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              "Selected Theme : ${selectedTheme == 0 ? "Light" : "Dark"}",
              style: const TextStyle(color: Colors.deepPurple),
            ),

            const Divider(),

            // Radio Buttons
            const Text(
              "Select Gender",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            RadioListTile(
              value: 0,
              groupValue: gender,
              title: const Text("Male"),
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile(
              value: 1,
              groupValue: gender,
              title: const Text("Female"),
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile(
              value: 2,
              groupValue: gender,
              title: const Text("Other"),
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            const Divider(),

            // Checkbox
            CheckboxListTile(
              value: acceptedTerms,
              title: const Text("I accept the Terms & Conditions"),
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  acceptedTerms = value!;
                });
              },
            ),

            const Divider(),

            // Slider
            const Text(
              "Font Size",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Slider(
              value: fontSize,
              min: 10,
              max: 30,
              activeColor: Colors.deepPurple,
              label: fontSize.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  fontSize = value;
                });
              },
            ),

            Center(
              child: Text(
                "Flutter is Awesome!",
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Divider(),

            // Choice Chips
            const Text(
              "Choose Your Interest",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Wrap(
              spacing: 10,
              children: [
                "Flutter",
                "AI",
                "Web Development",
                "Game Development",
              ].map((interest) {
                return ChoiceChip(
                  label: Text(interest),
                  selected: selectedInterest == interest,
                  selectedColor: Colors.deepPurple,
                  labelStyle: TextStyle(
                    color: selectedInterest == interest
                        ? Colors.white
                        : Colors.black,
                  ),
                  onSelected: (_) {
                    setState(() {
                      selectedInterest = interest;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 15),

            Text(
              "Selected Interest : $selectedInterest",
              style: const TextStyle(color: Colors.deepPurple),
            ),

            const Divider(),

            // Action Chips
            const Text(
              "Quick Actions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Wrap(
              spacing: 10,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.refresh),
                  label: const Text("Reset"),
                  onPressed: () {
                    setState(() {
                      notifications = true;
                      acceptedTerms = true;
                      gender = 1;
                      selectedTheme = 1;
                      fontSize = 20;
                      selectedInterest = "Flutter";
                    });
                  },
                ),

                ActionChip(
                  avatar: const Icon(Icons.save),
                  label: const Text("Save"),
                  backgroundColor: Colors.deepPurple,
                  labelStyle: const TextStyle(color: Colors.white),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Preferences Saved Successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Stepper
            Stepper(
              currentStep: currentStep,
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: const Text("Continue"),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text("Cancel"),
                    ),
                  ],
                );
              },
              onStepContinue: () {
                if (currentStep < 2) {
                  setState(() {
                    currentStep++;
                  });
                }
              },
              onStepCancel: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep--;
                  });
                }
              },
              steps: const [
                Step(
                  title: Text("Personal Details"),
                  content: Text("Step 1"),
                ),
                Step(
                  title: Text("Preferences"),
                  content: Text("Step 2"),
                ),
                Step(
                  title: Text("Finish"),
                  content: Text("Step 3"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}