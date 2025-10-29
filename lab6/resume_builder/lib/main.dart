import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/app_router.dart';
import 'repositories/github_repository.dart';
import 'viewmodels/github_viewmodel.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => GitHubRepository()),
        ProxyProvider<GitHubRepository, GitHubViewModel>(
          update: (_, repo, __) => GitHubViewModel(repository: repo),
        ),
      ],
      child: MaterialApp.router(
        title: 'Resume Builder',
        theme: ThemeData(primarySwatch: Colors.teal),
        routerConfig: router,
      ),
    );
  }
}
