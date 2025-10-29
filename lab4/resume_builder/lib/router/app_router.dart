import 'package:go_router/go_router.dart';
import '../views/resume_list_page.dart';
import '../views/resume_detail_page.dart';
import '../viewmodels/resume_viewmodel.dart';
import '../repositories/resume_repository.dart';

final ResumeRepository resumeRepository = ResumeRepository();
final ResumeViewModel resumeViewModel = ResumeViewModel(repository: resumeRepository);

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ResumeListPage(viewModel: resumeViewModel),
      routes: [
        GoRoute(
          path: 'detail/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return ResumeDetailPage(
              resume: resumeViewModel.getResumeById(id),
            );
          },
        ),
      ],
    ),
  ],
);
