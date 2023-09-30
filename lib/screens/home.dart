import 'package:flutter/material.dart';
import 'package:shopping_app/screens/cart.dart';
import 'package:shopping_app/screens/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentpage = 0;
  List<Widget> pages = [const Product_list(), const Cart()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedItemColor: const Color.fromARGB(255, 214, 195, 27),
        currentIndex: currentpage,
        onTap: (value) {
          setState(
            () {
              currentpage = value;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }
}
