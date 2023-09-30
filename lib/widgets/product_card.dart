import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/screens/product_details.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product, required this.color});
  final Map<String, Object> product;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return ProdutctDetailScreen(
            id:product['id'] as String,
            title: product['title'].toString(),
            image: product['imageUrl'].toString(), 
            price: product['price'].toString(), 
            size: (product['sizes'] as List<int>), 
            company: product['company'] as String,
          );
        }));
      },
      child: Card(
          margin: const EdgeInsets.only(bottom: 22, top: 0),
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 8, bottom: 10, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'].toString(),
                  style: GoogleFonts.lato(
                      fontSize: 25, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$ ${product['price']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset(
                    product['imageUrl'].toString(),
                    height: 170,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
