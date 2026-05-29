// -> Example of a guard
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthGuard {
  // final GetAuthenticatedUserUseCase _getAuthenticatedUserUseCase;

  const AuthGuard();

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    // Example of a guard, to implement when we will implement the authentification feature
    // final user = await _getAuthenticatedUserUseCase();
    // final isAuthenticated = user != null;
    // final isOnLogin = state.matchedLocation == AppRoutes.login;

    // if (!isAuthenticated && !isOnLogin) return AppRoutes.login;
    // if (isAuthenticated && isOnLogin) return AppRoutes.home;
    return null;
  }
}
