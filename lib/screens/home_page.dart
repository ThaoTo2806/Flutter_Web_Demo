import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/drawer_menu.dart';
import '../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<Product> products = [
    Product(name: "Bàn phím Keychron"),
    Product(name: "MSI Cyborg 15"),
    Product(name: "ASUS OLED"),
    Product(name: "PC Gaming"),
    Product(name: "Razer Pro Click"),
    Product(name: "Thẻ nhớ USB"),
    Product(name: "Loa"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      body: Column(
        children: [
          Header(
            searchController: searchController,
            productNames: products.map((p) => p.name).toList(),
          ),
          const NavigationBarWidget(),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    products[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
