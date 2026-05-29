import 'package:go_router/go_router.dart';

import '../../../layer_fonctional/home/presentation/home_page.dart';
import '../../../layer_fonctional/projet/presentation/projet_list_page.dart';
import '../../../layer_fonctional/sprint_presentation/presentation/sprint_setup_page.dart';
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
        path: AppRoutes.projets,
        builder: (context, state) => const ProjetListPage(),
      ),
      GoRoute(
        path: AppRoutes.sprintSetup,
        builder: (context, state) => const SprintSetupPage(),
      ),
    ],
  );
}
