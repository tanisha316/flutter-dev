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
      home: SmartCafe(),
    );
  }
}

class SmartCafe extends StatefulWidget {
  const SmartCafe({super.key});

  @override
  State<SmartCafe> createState() => _SmartCafeState();
}

class _SmartCafeState extends State<SmartCafe> {
  List<String> categories = [
    "Burger",
    "Pizza",
    "Sandwich",
    "Cold Coffee",
    "French Fries"
  ];

  Map<String, String> prices = {
    "Burger": "₹120",
    "Pizza": "₹199",
    "Sandwich": "₹99",
    "Cold Coffee": "₹89",
    "French Fries": "₹79",
  };

  String selectedCategory = "Burger";
  int quantity = 1;

  void increase() {
    setState(() {
      quantity++;
    });
  }

  void decrease() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Café"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: "cheese",
                child: Text("🧀 Add Cheese"),
              ),
              PopupMenuItem(
                value: "sauce",
                child: Text("🍅 Extra Sauce"),
              ),
              PopupMenuItem(
                value: "nutrition",
                child: Text("🌿 View Nutrition"),
              ),
              PopupMenuItem(
                value: "share",
                child: Text("🔗 Share Item"),
              ),
            ],
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: const Icon(Icons.restaurant_menu),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Choose Category",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),

            const SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              items: categories.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),

            const SizedBox(height: 25),

            const Text(
              "Selected Item",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [

                    Image.asset(
                      "assets/images/burger.png",
                      width: 90,
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            selectedCategory,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          const SizedBox(height: 5),

                          const Text(
                            "Fresh & Delicious Food",
                            style: TextStyle(color: Colors.grey),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            prices[selectedCategory]!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Quantity",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),

            const SizedBox(height: 10),

            Row(
              children: [

                IconButton(
                  onPressed: decrease,
                  icon: const Icon(Icons.remove_circle),
                  color: Colors.deepPurple,
                  iconSize: 40,
                ),

                Text(
                  "$quantity",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                IconButton(
                  onPressed: increase,
                  icon: const Icon(Icons.add_circle),
                  color: Colors.deepPurple,
                  iconSize: 40,
                ),
              ],
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.shopping_cart),
                label: const Text("Place Order"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text("Order Placed Successfully!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.bookmark_border),
                label: const Text("Save for Later"),
                onPressed: () {},
              ),
            ),

            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text(
                "Clear Selection",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}