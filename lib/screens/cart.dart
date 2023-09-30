import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/Provider/cartprovider.dart';


class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void delete(Map<String, dynamic> cartitem) {
    final trolley = Provider.of<CartProvider>(context, listen: false).cart;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Delete Product',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            content: const Text(
              'Are you sure you want to remove this product?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              TextButton(
                onPressed: () {
                  int index = trolley.indexOf(cartitem);
                  if (trolley.contains(cartitem)) {
                    setState(
                      () {
                        trolley.remove(cartitem);
                      },
                    );
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        action: SnackBarAction(
                          label: 'Undo',
                          textColor: Colors.blueGrey,
                          onPressed: () {
                            setState(
                              () {
                                trolley.insert(index, cartitem);
                              },
                            );
                          },
                        ),
                        content: const Text(
                          'Product Deleted',
                        ),
                      ),
                    );
                  }
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final cart = (Provider.of<CartProvider>(context).cart);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cart',
        ),
      ),
      body: cart.isEmpty
          ? Center(
              child: Text(
                'Cart is Empty',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : ListView.builder(
              itemCount: Provider.of<CartProvider>(context).cart.length,
              itemBuilder: (ctx, index) {
                final cartitem = cart[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      cartitem['imageUrl'] as String,
                    ),
                    radius: 30,
                  ),
                  title: Text(
                    cartitem['title'] as String,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  subtitle: Text('${cartitem['size']} '),
                  trailing: IconButton(
                    onPressed: () {
                      delete(cartitem);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
