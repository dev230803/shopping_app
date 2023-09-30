import 'package:flutter/material.dart';
import 'package:shopping_app/data/global_variable.dart';
import 'package:shopping_app/widgets/filters.dart';
import 'package:shopping_app/widgets/product_card.dart';

class Product_list extends StatefulWidget {
  const Product_list({super.key});

  @override
  State<Product_list> createState() => _Product_listState();
}

class _Product_listState extends State<Product_list> {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(50),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Shoes \nCollection',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search',
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                      ),
                    ),
                  )
                ],
              ),
              const Filters(),
              Expanded(
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductDetail(
                      product: products[index],
                      color: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromRGBO(245, 247, 249, 1),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
  }
}