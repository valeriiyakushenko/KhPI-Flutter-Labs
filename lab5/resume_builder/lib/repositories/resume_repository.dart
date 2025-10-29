import '../models/resume_model.dart';

class ResumeRepository {
  final List<Resume> _resumes = [
    Resume(
      id: '1',
      name: 'Valerii Yakshenko',
      email: 'valerii.yakushenko@gmail.com',
      phone: '+1-647-534-4691',
      location: 'Toronto, Ontario',
      title: 'Flutter Developer',
      description: 'Починаючий Flutter розробник. Спеціалізуюсь на чистому коді та сучасних архітектурах.',
      avatarUrl: 'https://i.postimg.cc/sXZCSqD9/IMG-6077.jpg',
    ),
    Resume(
      id: '2',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phone: '+1-555-123-4567',
      location: 'New York, USA',
      title: 'Product Manager',
      description: 'Experienced product manager with a background in mobile and web products. Focused on user-centered design and data-driven decisions.',
      avatarUrl: '',
    ),
    Resume(
      id: '3',
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      phone: '+44-20-7946-0958',
      location: 'London, UK',
      title: 'UI/UX Designer',
      description: 'Creative UI/UX designer with experience in prototyping and user research. Passionate about accessibility and delightful interfaces.',
      avatarUrl: '',
    ),
  ];

  List<Resume> getAll() => List.unmodifiable(_resumes);

  Resume getById(String id) => _resumes.firstWhere((r) => r.id == id);
}