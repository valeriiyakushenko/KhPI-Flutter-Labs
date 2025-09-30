import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Головна сторінка'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Аватар и основная информация
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://i.postimg.cc/sXZCSqD9/IMG-6077.jpg'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    viewModel.homeData.userName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    viewModel.homeData.position,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // О себе
            const Text(
              'Про себе:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              viewModel.homeData.summary,
              style: const TextStyle(fontSize: 16),
            ),
            
            const SizedBox(height: 32),
            
            // Навыки
            const Text(
              'Навички:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Flutter',
                'Git',
                'MVVM',
              ].map((skill) => Chip(
                label: Text(skill),
                backgroundColor: Colors.blue[50],
              )).toList(),
            ),
            
            const Spacer(),
            
            // Кнопка перехода
            Center(
              child: ElevatedButton(
                onPressed: () => viewModel.navigateToProfile(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Перейти до профілю'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}