import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 24),
            Text(
              'Product Details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            Text(
              'Product ID: $productId',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'This screen was opened via the deep link:\n'
              'deeplink://app.example.com/product/<id>',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
