import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deep Link Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.link, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 24),
            Text(
              'Welcome to the DeepLink App',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const Text(
              'Try opening a deep link to navigate directly to a screen.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.push('/product/42'),
              child: const Text('View Product #42'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.push('/profile/johndoe'),
              child: const Text('View Profile: johndoe'),
            ),
          ],
        ),
      ),
    );
  }
}
