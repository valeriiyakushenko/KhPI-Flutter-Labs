import '../models/resume_model.dart';

class ResumeViewModel {
  final List<Resume> _resumes = [
    Resume(
      id: '1',
      name: 'Valerii Yakshenko',
      email: 'valerii.yakushenko@gmail.com',
      phone: '+1-647-534-4691',
      location: 'Toronto, Ontatio',
      title: 'Flutter Developer',
      description: 'Починаючий Flutter розробник. Спеціалізуюсь на чистому коді та сучасних архітектурах.',
      avatarUrl: 'https://i.postimg.cc/sXZCSqD9/IMG-6077.jpg',

    ),
  ];

  List<Resume> get resumes => _resumes;

  Resume getResumeById(String id) {
    return _resumes.firstWhere((resume) => resume.id == id);
  }
}