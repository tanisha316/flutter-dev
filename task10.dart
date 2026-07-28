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
      home: FoodListScreen(),
    );
  }
}

class FoodListScreen extends StatelessWidget {
  FoodListScreen({super.key});

  final List<Map<String, dynamic>> foodItems = [
    {
      "icon": "🍔",
      "name": "Cheese Burger",
      "price": "₹149",
    },
    {
      "icon": "🍕",
      "name": "Veg Pizza",
      "price": "₹199",
    },
    {
      "icon": "🍝",
      "name": "Pasta",
      "price": "₹179",
    },
    {
      "icon": "🥪",
      "name": "Sandwich",
      "price": "₹99",
    },
    {
      "icon": "🥤",
      "name": "Cold Drink",
      "price": "₹49",
    },
    {
      "icon": "🍦",
      "name": "Ice Cream",
      "price": "₹69",
    },
    {
      "icon": "🍰",
      "name": "Chocolate Cake",
      "price": "₹149",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("ListView Example"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: foodItems.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: 8),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Text(
                  foodItems[index]["icon"],
                  style: const TextStyle(fontSize: 40),
                ),
                title: Text(
                  foodItems[index]["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                subtitle: Text(
                  foodItems[index]["price"],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.green,
                  size: 34,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}