import 'package:ecommerce_app/provider/category_provider.dart';
import 'package:ecommerce_app/provider/order_provider.dart';
import 'package:ecommerce_app/screen/auth/login_page.dart';
import 'package:ecommerce_app/screen/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context)=>Order_provider()),
       ChangeNotifierProvider(create: (context)=>Category_provider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash_screen(),
      ),
    );
  }
}
