import '../models/resume_model.dart';
import '../repositories/resume_repository.dart';

class ResumeViewModel {
  final ResumeRepository repository;

  ResumeViewModel({required this.repository});

  List<Resume> get resumes => repository.getAll();

  Resume getResumeById(String id) {
    return repository.getById(id);
  }
}