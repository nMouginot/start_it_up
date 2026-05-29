import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Placeholder guard. Will gate routes once an auth feature is added.
class AuthGuard {
  const AuthGuard();

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    return null;
  }
}
