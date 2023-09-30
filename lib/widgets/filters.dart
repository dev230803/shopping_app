import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final List<String> filter = const ['All', 'Adidas', 'Nike', 'Bata'];

  late String selectedFilter;
  @override
  void initState() {
   
    super.initState();
    selectedFilter = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filter.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = filter[index];
                });
              },
              child: Chip(
                backgroundColor: selectedFilter == filter[index]
                    ? Colors.yellow
                    : const Color.fromRGBO(245, 247, 249, 1),
                side: const BorderSide(
                  color: Color.fromRGBO(245, 247, 249, 1),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.all(14),
                label: Text(filter[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
