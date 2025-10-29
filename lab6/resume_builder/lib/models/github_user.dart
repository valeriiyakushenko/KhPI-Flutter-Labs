class GitHubUser {
  final String login;
  final String? name;
  final String avatarUrl;
  final int followers;
  final int following;
  final int publicRepos;
  final String? bio;
  final String? email;
  final String? location;

  GitHubUser({
    required this.login,
    required this.avatarUrl,
    required this.followers,
    required this.following,
    required this.publicRepos,
    this.name,
    this.bio,
    this.email,
    this.location,
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return GitHubUser(
      login: json['login'] as String,
      name: json['name'] as String?,
      avatarUrl: json['avatar_url'] as String,
      followers: json['followers'] as int? ?? 0,
      following: json['following'] as int? ?? 0,
      publicRepos: json['public_repos'] as int? ?? 0,
      bio: json['bio'] as String?,
      email: json['email'] as String?,
      location: json['location'] as String?,
    );
  }
}