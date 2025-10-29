import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/resume_viewmodel.dart';
import '../widgets/resume_card.dart';

class ResumeListPage extends StatelessWidget {
  final ResumeViewModel viewModel;

  const ResumeListPage({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final resumes = viewModel.resumes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumes'),
      ),
      body: ListView.builder(
        itemCount: resumes.length,
        itemBuilder: (context, index) {
          final resume = resumes[index];
          return InkWell(
            onTap: () => context.go('/detail/${resume.id}'),
            child: ResumeCard(
              resume: resume,
              onDuplicate: () => context.go('/create', extra: resume),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'create_resume_fab', // уникальный тег
              tooltip: 'Create new resume',
              onPressed: () => context.go('/create'),
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 16),
            FloatingActionButton(
              heroTag: 'github_stats_fab', // уникальный тег
              tooltip: 'Show GitHub stats',
              onPressed: () => context.go('/github_input'),
              child: const Icon(Icons.code),
            ),
          ],
        ),
      ),
    );
  }
}
