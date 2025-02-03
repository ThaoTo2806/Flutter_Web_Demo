import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/slider_introduction.dart';
import '../widgets/body_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(); // Key để mở Drawer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey, // Gán key cho Scaffold
      drawer: const DrawerMenu(), // Menu bên trái
      body: SafeArea(
        child: SingleChildScrollView(
          // Bọc trong SingleChildScrollView
          child: Column(
            children: [
              // Header với nút mở Drawer
              Header(
                searchController: searchController,
                scaffoldKey: scaffoldKey,
              ),
              const SliderIntroduction(),
              // Thanh Navigation Bar
              const NavigationBarWidget(),
              const BodyHome(),
            ],
          ),
        ),
      ),
    );
  }
}
