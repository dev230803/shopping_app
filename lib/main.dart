import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Provider/cartprovider.dart';
import 'package:shopping_app/screens/home.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(255, 206, 1, 1),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            )
          ),),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    ),
  ));
}
