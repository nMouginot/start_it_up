import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../../layer_technical/navigation/data/app_routes.dart';
import '../../domain/entity/projet.dart';
import 'cubit/projet_list_cubit.dart';
import 'cubit/projet_list_state.dart';

class ProjetListPage extends StatelessWidget {
  const ProjetListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProjetListCubit>()..load(),
      child: const _ProjetListView(),
    );
  }
}

class _ProjetListView extends StatelessWidget {
  const _ProjetListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projets')),
      body: SafeArea(
        child: BlocBuilder<ProjetListCubit, ProjetListState>(
          builder: (context, state) => switch (state) {
            ProjetListLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProjetListError(:final error) => Center(
              child: Text('Erreur : $error'),
            ),
            ProjetListLoaded(:final projets) => _ProjetList(projets: projets),
          },
        ),
      ),
    );
  }
}

class _ProjetList extends StatelessWidget {
  final List<Projet> projets;

  const _ProjetList({required this.projets});

  @override
  Widget build(BuildContext context) {
    if (projets.isEmpty) {
      return const Center(child: Text('Aucun projet.'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: projets.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, index) => _ProjetCard(projet: projets[index]),
    );
  }
}

class _ProjetCard extends StatelessWidget {
  final Projet projet;

  const _ProjetCard({required this.projet});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: CircleAvatar(child: Text('${projet.id}')),
        title: Text(projet.name),
        subtitle: Text('v${projet.version}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => context.go(AppRoutes.projetDetailPath(projet.id)),
      ),
    );
  }
}
