import '../models/github_user.dart';
import '../repositories/github_repository.dart';

class GitHubViewModel {
  final GitHubRepository repository;

  GitHubViewModel({required this.repository});

  Future<GitHubUser> fetchUser(String username) => repository.fetchUser(username);
}