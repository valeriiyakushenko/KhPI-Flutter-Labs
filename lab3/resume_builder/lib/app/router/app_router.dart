import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/view/home_page.dart';
import '../../features/profile/view/profile_page.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Помилка: ${state.error}'),
      ),
    ),
  );
}