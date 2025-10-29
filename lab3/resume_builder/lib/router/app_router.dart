import 'package:go_router/go_router.dart';
import '../views/resume_list_page.dart';
import '../views/resume_detail_page.dart';
import '../viewmodels/resume_viewmodel.dart';

final ResumeViewModel resumeViewModel = ResumeViewModel();

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
