import 'package:flutter/material.dart';
import 'package:shopping_app/screens/checkout.dart';
import 'package:shopping_app/screens/product.dart';
import 'package:shopping_app/models/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink)),
      home: const BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  final List<Product> product = [
    Product(name: 'Baby dress', price: 4500, imageUrl: 'assets/babydress.png'),
    Product(
        name: 'Baby feeder', price: 5500, imageUrl: 'assets/babyfeeder.png'),
    Product(name: 'Baby shawl', price: 5500, imageUrl: 'assets/babyshawl.png'),
    Product(name: 'Baby shoe', price: 3500, imageUrl: 'assets/babyshoe.png'),
    Product(name: 'Baby sitter', price: 14500, imageUrl: 'assets/babysit.png'),
    Product(name: 'Baby toys', price: 5000, imageUrl: 'assets/babytoys.png')
  ];

  final List<Product> checkout = [];

  // List<Widget> widgetOptions(BuildContext context, List<Product> products,
  //         List<Product> checkout) =>
  //     [
  //   ProductPge(
  //     products: products, AddToCart: addToCart,
  //   ),
  //   CheckoutSce(
  //     checkout: checkout,removeFromCart: removeFromCart, )
  // ];

  void onTapItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void addToCart(Product product) {
    setState(() {
      checkout.add(product);
    });
  }

  void removeFromCart(Product product) {
    setState(() {
      checkout.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: const Text('Shopping App'),
      ),
      body: Center(
          child:
              // widgetOptions(context, product, checkout).elementAt(SelectedIndex),
              selectedIndex == 0
                  ? ProductPge(
                      products: product,
                      addToCart: addToCart,
                    )
                  : CheckoutSce(
                      checkout: checkout,
                      removeFromCart: removeFromCart,
                    )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.shop_two_rounded), label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout_rounded), label: 'Cart')
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).colorScheme.secondaryContainer,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onTap: onTapItem,
      ),
    );
  }
}
