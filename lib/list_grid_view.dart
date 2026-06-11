import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductGridScreen(),
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  const ProductGridScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {"name": "Laptop", "price": 50000},
    {"name": "Mobile", "price": 20000},
    {"name": "Headphones", "price": 1500},
    {"name": "Keyboard", "price": 1200},
    {"name": "Mouse", "price": 800},
    {"name": "Monitor", "price": 10000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Grid"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_bag,
                  size: 50,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
                Text(
                  products[index]["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("₹${products[index]["price"]}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
