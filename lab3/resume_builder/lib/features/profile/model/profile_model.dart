class ProfileModel {
  final String email;
  final String phone;
  final String location;
  final List<Education> education;

  ProfileModel({
    required this.email,
    required this.phone,
    required this.location,
    required this.education,
  });
}

class Education {
  final String institution;
  final String degree;
  final String period;

  Education({
    required this.institution,
    required this.degree,
    required this.period,
  });
}