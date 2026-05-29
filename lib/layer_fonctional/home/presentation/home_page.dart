import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../layer_technical/navigation/data/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start it up')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _HomeAction(
                  icon: Icons.folder_open,
                  label: 'Projets',
                  onTap: () => context.go(AppRoutes.projets),
                ),
                const SizedBox(height: 16),
                _HomeAction(
                  icon: Icons.slideshow,
                  label: 'Générer une présentation',
                  onTap: () => context.go(AppRoutes.sprintSetup),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _HomeAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: onTap,
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
      ),
    );
  }
}
