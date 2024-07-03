import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  int SelectedIndex = 0;
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
      SelectedIndex = index;
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
              SelectedIndex == 0
                  ? ProductPge(
                      products: product,
                      AddToCart: addToCart,
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
        currentIndex: SelectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onTap: onTapItem,
      ),
    );
  }
}
  

















































//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Shopping App',
//         theme: ThemeData(
//           useMaterial3: true,
//           colorScheme:
//               ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 144, 39, 8)),
//         ),
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text("Shopping App"),
//             backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//           ),
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           body: const BottomNavBar(),
//         ));
//   }
// }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key});

// //   // This widget is the home page of your application. It is stateful, meanin

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Theme.of(context).colorScheme.primaryContainer,
// //           title: Text("Shopping App"),
// //         ),
// //         body: ());
// //   }
// // }

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   var SelectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     Widget page;
//     switch (SelectedIndex) {
//       case 0:
//         page = const ProductPge();
//         break;
//       case 1:
//         page = const Checkout();
//         break;
//       default:
//         throw UnimplementedError('no widget for $SelectedIndex');
//     }
//     return Row(
//       children: [
//         BottomNavigationBar(
//           backgroundColor: Theme.of(context).colorScheme.primaryContainer,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.shop_two), label: 'Products'),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.shopping_cart_checkout), label: 'Products')
//           ],
//           currentIndex: SelectedIndex,
//           onTap: (value) {
//             setState(() {
//               SelectedIndex = value;
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
// }