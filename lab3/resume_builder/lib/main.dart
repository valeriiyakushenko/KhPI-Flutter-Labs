import 'package:flutter/material.dart';
import 'router/app_router.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Resume Builder',
      theme: ThemeData(primarySwatch: Colors.teal),
      routerConfig: router,
    );
  }
}
