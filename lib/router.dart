import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/home_screen.dart';
import 'screens/product_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/not_found_screen.dart';

/// The deep link scheme and host used throughout the app.
const String kDeepLinkScheme = 'deeplink';
const String kDeepLinkHost = 'app.example.com';

/// App router with deep link support.
///
/// Supported deep links:
///   deeplink://app.example.com/
///   deeplink://app.example.com/product/:id
///   deeplink://app.example.com/profile/:username
///
/// Web / HTTPS universal links (same paths):
///   https://app.example.com/
///   https://app.example.com/product/:id
///   https://app.example.com/profile/:username
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => NotFoundScreen(uri: state.uri.toString()),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? '';
        return ProductScreen(productId: id);
      },
    ),
    GoRoute(
      path: '/profile/:username',
      builder: (context, state) {
        final username = state.pathParameters['username'] ?? '';
        return ProfileScreen(username: username);
      },
    ),
  ],
);
