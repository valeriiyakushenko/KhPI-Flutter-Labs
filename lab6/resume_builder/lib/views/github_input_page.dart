import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../viewmodels/github_viewmodel.dart';
import '../models/github_user.dart';

class GitHubInputPage extends StatefulWidget {
  const GitHubInputPage({super.key});

  @override
  State<GitHubInputPage> createState() => _GitHubInputPageState();
}

class _GitHubInputPageState extends State<GitHubInputPage> {
  final _controller = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter GitHub username'), leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        )),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'username',
              ),
              onSubmitted: (_) => _fetch(),
            ),
            const SizedBox(height: 12),
            if (_error != null) Text(_error!, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _loading ? null : _fetch,
              child: _loading ? const CircularProgressIndicator() : const Text('Show'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetch() async {
    final username = _controller.text.trim();
    if (username.isEmpty) return;
    setState(() { _loading = true; _error = null; });
    try {
      final vm = context.read<GitHubViewModel>();
      final GitHubUser user = await vm.fetchUser(username);
      // navigate to route that will display detail with GitHub info
      context.go('/github', extra: user);
    } catch (e) {
      setState(() { _error = e.toString(); });
    } finally {
      if (mounted) setState(() { _loading = false; });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}