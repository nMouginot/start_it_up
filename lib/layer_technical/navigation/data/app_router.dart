import 'package:go_router/go_router.dart';

import '../../../layer_fonctional/home/page/home_page.dart';
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
      // GoRoute(
      //   path: AppRoutes.reservation,
      //   builder: (context, state) => const ReservationPage(),
      // ),
      // GoRoute(
      //   path: AppRoutes.reservationDetail,
      //   builder: (context, state) {
      //     final id = state.pathParameters['id']!;
      //     return ReservationDetailPage(id: id);
      //   },
      // ),
    ],
  );
}
