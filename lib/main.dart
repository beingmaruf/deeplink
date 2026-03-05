import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(const DeepLinkApp());
}

class DeepLinkApp extends StatelessWidget {
  const DeepLinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DeepLink Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}
