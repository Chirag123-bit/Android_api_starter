import 'package:batch28_api_starter/screen/screen1.dart';
import 'package:batch28_api_starter/screen/screen2.dart';
import 'package:batch28_api_starter/screen/screen3.dart';
import 'package:batch28_api_starter/screen/screen4.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  List<Widget> lstWidget = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree(),
    const ScreenFour(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Dashboard"),
        centerTitle: true,
      ),
      body: lstWidget[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF6200EE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          // _selectedIndex = index;
        },

        // icon: const Icon(Icons.camera),
        backgroundColor: Colors.green,
        child: const Icon(Icons.camera_alt_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
