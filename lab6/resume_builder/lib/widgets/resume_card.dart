import 'package:flutter/material.dart';
import '../models/resume_model.dart';

class ResumeCard extends StatelessWidget {
  final Resume resume;
  final VoidCallback? onDuplicate;

  const ResumeCard({super.key, required this.resume, this.onDuplicate});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: resume.avatarUrl.isNotEmpty
              ? NetworkImage(resume.avatarUrl)
              : null,
          child: resume.avatarUrl.isEmpty ? const Icon(Icons.person) : null,
        ),
        title: Text(resume.name),
        subtitle: Text(resume.title),
        trailing: onDuplicate != null
            ? IconButton(
                icon: const Icon(Icons.copy),
                tooltip: 'Duplicate',
                onPressed: onDuplicate,
              )
            : null,
      ),
    );
  }
}
