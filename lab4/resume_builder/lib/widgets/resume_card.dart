import 'package:flutter/material.dart';
import '../models/resume_model.dart';

class ResumeCard extends StatelessWidget {
  final Resume resume;

  const ResumeCard({super.key, required this.resume});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(resume.avatarUrl)),
        title: Text(resume.name),
        subtitle: Text(resume.title),
      ),
    );
  }
}
 