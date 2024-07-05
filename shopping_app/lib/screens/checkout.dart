import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/screens/ordersuccess.dart';

class CheckoutSce extends StatelessWidget {
  const CheckoutSce(
      {super.key, required this.checkout, required this.removeFromCart});

  final List<Product> checkout;
  final Function(Product) removeFromCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: checkout.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: SingleChildScrollView(
                        child: ListTile(
                          leading: Image.asset(
                            checkout[index].imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            checkout[index].name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('\$${checkout[index].price}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              removeFromCart(checkout[index]);
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                })),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrdersuccessfulScreen()));
              },
              child: const Text('Place Order')),
        )
      ],
    );
  }
}
