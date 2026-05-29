import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../../layer_technical/navigation/data/app_routes.dart';
import '../../../objectif/domain/entity/objectif.dart';
import '../../../objectif/presentation/widget/objectif_list_tile.dart';
import '../../domain/entity/projet.dart';
import 'cubit/projet_detail_cubit.dart';
import 'cubit/projet_detail_state.dart';

class ProjetDetailPage extends StatelessWidget {
  final int projetId;

  const ProjetDetailPage({super.key, required this.projetId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<ProjetDetailCubit>()..load(projetId),
      child: _ProjetDetailView(projetId: projetId),
    );
  }
}

class _ProjetDetailView extends StatelessWidget {
  final int projetId;

  const _ProjetDetailView({required this.projetId});

  Future<void> _createObjectif(BuildContext context) async {
    final cubit = BlocProvider.of<ProjetDetailCubit>(context);
    await context.push<bool>(AppRoutes.projetObjectifCreatePath(projetId));
    await cubit.load(projetId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projet')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _createObjectif(context),
        icon: const Icon(Icons.add),
        label: const Text('Objectif'),
      ),
      body: SafeArea(
        child: BlocBuilder<ProjetDetailCubit, ProjetDetailState>(
          builder: (context, state) => switch (state) {
            ProjetDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProjetDetailError(:final error) => Center(
              child: Text('Erreur : $error'),
            ),
            ProjetDetailLoaded(:final projet, :final objectifs) => _LoadedView(
              projet: projet,
              objectifs: objectifs,
            ),
          },
        ),
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final Projet projet;
  final List<Objectif> objectifs;

  const _LoadedView({required this.projet, required this.objectifs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ProjetHeader(projet: projet, objectifCount: objectifs.length),
        const Divider(height: 1),
        Expanded(child: _ObjectifList(objectifs: objectifs)),
      ],
    );
  }
}

class _ProjetHeader extends StatelessWidget {
  final Projet projet;
  final int objectifCount;

  const _ProjetHeader({required this.projet, required this.objectifCount});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(projet.name, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 4),
          Text('Version ${projet.version}', style: theme.textTheme.titleSmall),
          const SizedBox(height: 12),
          Text('$objectifCount objectif(s)', style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _ObjectifList extends StatelessWidget {
  final List<Objectif> objectifs;

  const _ObjectifList({required this.objectifs});

  @override
  Widget build(BuildContext context) {
    if (objectifs.isEmpty) {
      return const Center(child: Text('Aucun objectif pour ce projet.'));
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: objectifs.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (_, index) => ObjectifListTile(objectif: objectifs[index]),
    );
  }
}
