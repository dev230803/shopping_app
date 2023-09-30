import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Provider/cartprovider.dart';

class ProdutctDetailScreen extends StatefulWidget {
  const ProdutctDetailScreen(
      {super.key,
      required this.title,
      required this.image,
      required this.price,
      required this.size, required this.company, required this.id});
  final String id ;
  final String title;
  final String company;
  final String image;
  final String price;
  final List<int> size;

  @override
  State<ProdutctDetailScreen> createState() => _ProdutctDetailScreenState();
}

class _ProdutctDetailScreenState extends State<ProdutctDetailScreen> {
  int selectedsize = 0;
  void onTap(){
    if(selectedsize!=0){
      Provider.of<CartProvider>(context,listen: false).addProduct(
      {
        'id': widget.id,
        'title': widget.title,
        'price': widget.price,
        'imageUrl': widget.image,
        'company': 'Nike',
        'size': selectedsize,
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Product Added'),duration: Duration(milliseconds: 500),));
    }
      else{
    ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Select Size')));
      }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 32),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                widget.image,
                height: 250,
              ),
            ),
            const Spacer(flex: 2),
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromRGBO(245, 247, 249, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${widget.price}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 35),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 40),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.size.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  selectedsize = widget.size[index];
                                },
                              );
                            },
                            child: Chip(
                              backgroundColor:
                                  selectedsize == widget.size[index]
                                      ? Colors.yellow
                                      : null,
                              label: Text(
                                '${widget.size[index]}',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.shopping_cart_outlined),
                      label: const Text('Add To Cart'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
