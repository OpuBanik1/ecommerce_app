import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Product_page extends StatefulWidget {
  const Product_page({super.key});

  @override
  State<Product_page> createState() => _Product_pageState();
}

class _Product_pageState extends State<Product_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
