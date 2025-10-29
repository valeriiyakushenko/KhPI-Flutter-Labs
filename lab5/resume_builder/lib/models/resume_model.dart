class Resume {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String title;
  final String description;
  final String avatarUrl;


  Resume({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.title,
    required this.description,
    required this.avatarUrl,
  });

  Resume copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? location,
    String? title,
    String? description,
    String? avatarUrl,
  }) {
    return Resume(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      title: title ?? this.title,
      description: description ?? this.description,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
