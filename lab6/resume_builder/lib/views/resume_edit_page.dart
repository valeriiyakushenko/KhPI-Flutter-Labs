import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/resume_model.dart';
import '../router/app_router.dart'; // to access global resumeViewModel

class ResumeEditPage extends StatefulWidget {
  final Resume? initial;

  const ResumeEditPage({super.key, this.initial});

  @override
  State<ResumeEditPage> createState() => _ResumeEditPageState();
}

class _ResumeEditPageState extends State<ResumeEditPage> {
  late final TextEditingController _nameC;
  late final TextEditingController _emailC;
  late final TextEditingController _phoneC;
  late final TextEditingController _locationC;
  late final TextEditingController _titleC;
  late final TextEditingController _descC;
  late final TextEditingController _avatarC;

  @override
  void initState() {
    super.initState();
    final r = widget.initial;
    _nameC = TextEditingController(text: r?.name ?? '');
    _emailC = TextEditingController(text: r?.email ?? '');
    _phoneC = TextEditingController(text: r?.phone ?? '');
    _locationC = TextEditingController(text: r?.location ?? '');
    _titleC = TextEditingController(text: r?.title ?? '');
    _descC = TextEditingController(text: r?.description ?? '');
    _avatarC = TextEditingController(text: r?.avatarUrl ?? '');
  }

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _phoneC.dispose();
    _locationC.dispose();
    _titleC.dispose();
    _descC.dispose();
    _avatarC.dispose();
    super.dispose();
  }

  void _save() {
    final name = _nameC.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Name is required')));
      return;
    }

    final newResume = Resume(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: _emailC.text.trim(),
      phone: _phoneC.text.trim(),
      location: _locationC.text.trim(),
      title: _titleC.text.trim(),
      description: _descC.text.trim(),
      avatarUrl: _avatarC.text.trim(),
    );

    // Додаємо в репозиторій через глобальний viewmodel
    resumeViewModel.addResume(newResume);

    // Перейти до деталей нового резюме
    context.go('/detail/${newResume.id}');
  }

  @override
  Widget build(BuildContext context) {
    final isDuplicate = widget.initial != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isDuplicate ? 'Duplicate / Edit Resume' : 'Create Resume'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(controller: _nameC, decoration: const InputDecoration(labelText: 'Name')),
            const SizedBox(height: 8),
            TextField(controller: _titleC, decoration: const InputDecoration(labelText: 'Title')),
            const SizedBox(height: 8),
            TextField(controller: _emailC, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 8),
            TextField(controller: _phoneC, decoration: const InputDecoration(labelText: 'Phone')),
            const SizedBox(height: 8),
            TextField(controller: _locationC, decoration: const InputDecoration(labelText: 'Location')),
            const SizedBox(height: 8),
            TextField(controller: _avatarC, decoration: const InputDecoration(labelText: 'Avatar URL')),
            const SizedBox(height: 8),
            TextField(
              controller: _descC,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _save,
              child: Text(isDuplicate ? 'Save as new' : 'Create'),
            ),
          ],
        ),
      ),
    );
  }
}