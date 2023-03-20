import 'package:ecommerce_app/navbar/catagoery.dart';
import 'package:ecommerce_app/navbar/order_page.dart';
import 'package:ecommerce_app/navbar/product_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [Product_page(), Category_page(), Order_page()];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.notifications, size: 30),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
      body: pages[currentPage],
    );
  }
}
