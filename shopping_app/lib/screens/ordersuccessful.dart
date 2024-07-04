import 'package:flutter/material.dart';

class OrdersuccessfulScreen extends StatelessWidget {
  const OrdersuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: const Text('Shopping App'),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
      ),
      body: const Center(
        child: Text('Your order has been placed successfully!'),
      ),
    );
  }
}
