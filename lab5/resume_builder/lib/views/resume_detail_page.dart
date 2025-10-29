import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/resume_model.dart';
import '../models/github_user.dart';

class ResumeDetailPage extends StatelessWidget {
  final Resume resume;
  final GitHubUser? githubUser;

  const ResumeDetailPage({super.key, required this.resume, this.githubUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(resume.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(resume.avatarUrl),
            ),
            const SizedBox(height: 20),
            Text(
              resume.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              resume.title,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 20),

            if (githubUser == null) ...[
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _infoRow(Icons.email, resume.email),
                    const SizedBox(height: 8),
                    _infoRow(Icons.phone, resume.phone),
                    const SizedBox(height: 8),
                    _infoRow(Icons.location_on, resume.location),
                  ],
                ),
              ),
            ),
            ],

            if (githubUser != null) ...[
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _infoRow(Icons.location_on, resume.location),
                  ],
                ),
              ),
            ),
            ],

            const SizedBox(height: 20),

            if (githubUser != null) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "GitHub Statistics",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[700],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _statItem('Repos', githubUser!.publicRepos.toString()),
                      _statItem('Followers', githubUser!.followers.toString()),
                      _statItem('Following', githubUser!.following.toString()),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About Me",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[700],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              resume.description,
              style: const TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _statItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
