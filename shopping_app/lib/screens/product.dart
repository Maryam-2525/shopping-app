import 'package:flutter/material.dart';
import 'package:shopping_app/models/product.dart';

class ProductPge extends StatelessWidget {
  const ProductPge(
      {super.key, required this.products, required this.addToCart});
  final List<Product> products;
  final Function(Product) addToCart;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: Image.asset(
                  products[index].imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(products[index].name),
                subtitle: Text(
                  '\$${products[index].price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.shopping_cart_checkout),
                  onPressed: () {
                    addToCart(products[index]);
                  },
                ),
              ),
            ),
          );
        });
  }
}
