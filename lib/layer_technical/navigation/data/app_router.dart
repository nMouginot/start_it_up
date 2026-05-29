import 'package:go_router/go_router.dart';

import '../../../layer_fonctional/home/presentation/home_page.dart';
import '../../../layer_fonctional/objectif/domain/entity/objectif.dart';
import '../../../layer_fonctional/objectif/presentation/objectif_form/objectif_form_page.dart';
import '../../../layer_fonctional/project/domain/entity/project.dart';
import '../../../layer_fonctional/project/presentation/project_detail/project_detail_page.dart';
import '../../../layer_fonctional/project/presentation/project_form/project_form_page.dart';
import '../../../layer_fonctional/project/presentation/project_list/project_list_page.dart';
import '../../../layer_fonctional/slide_presentation/presentation/slide_setup/slide_setup_page.dart';
import '../domain/guards/auth_guard.dart';
import 'app_routes.dart';

class AppRouter {
  final AuthGuard _authGuard;

  AppRouter(this._authGuard);

  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    redirect: _authGuard.redirect,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.projects,
        builder: (context, state) => const ProjectListPage(),
      ),
      GoRoute(
        path: AppRoutes.projectCreate,
        builder: (context, state) => const ProjectFormPage(),
      ),
      GoRoute(
        path: AppRoutes.projectDetail,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ProjectDetailPage(projectId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.projectEdit,
        builder: (context, state) {
          final existing = state.extra as Project?;
          return ProjectFormPage(existing: existing);
        },
      ),
      GoRoute(
        path: AppRoutes.objectifCreate,
        builder: (context, state) => const ObjectifFormPage(),
      ),
      GoRoute(
        path: AppRoutes.projectObjectifCreate,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return ObjectifFormPage(initialProjectId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.objectifEdit,
        builder: (context, state) {
          final existing = state.extra as Objectif?;
          return ObjectifFormPage(existing: existing);
        },
      ),
      GoRoute(
        path: AppRoutes.slideSetup,
        builder: (context, state) => const SlideSetupPage(),
      ),
    ],
  );
}
