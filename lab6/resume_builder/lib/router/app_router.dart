import 'package:go_router/go_router.dart';
import '../views/resume_list_page.dart';
import '../views/resume_detail_page.dart';
import '../viewmodels/resume_viewmodel.dart';
import '../repositories/resume_repository.dart';
import '../views/github_input_page.dart';
import '../models/github_user.dart';
import '../views/resume_edit_page.dart';
import '../models/resume_model.dart';

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
    GoRoute(
      path: '/create',
      builder: (context, state) {
        final initial = state.extra as Resume?;
        return ResumeEditPage(initial: initial);
      },
    ),
    GoRoute(
      path: '/github_input',
      builder: (context, state) => const GitHubInputPage(),
    ),
    GoRoute(
      path: '/github',
      builder: (context, state) {
        final githubUser = state.extra as GitHubUser?;
        if (githubUser == null) {
          return ResumeDetailPage(
            resume: resumeViewModel.getResumeById('1'),
          );
        }
        final resumeFromGit = resumeViewModel.getResumeById('1').copyWith(
          id: githubUser.login,
          name: githubUser.name ?? githubUser.login,
          title: 'GitHub / ${githubUser.login}',
          description: githubUser.bio ?? '',
          avatarUrl: githubUser.avatarUrl,
          email: githubUser.email ?? '',
          phone: '',
          location: githubUser.location ?? '',
        );
        return ResumeDetailPage(resume: resumeFromGit, githubUser: githubUser);
      },
    ),
  ],
);
