import 'package:flutter/material.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../../project/domain/entity/project.dart';
import '../../../project/domain/use_case/get_projects_use_case.dart';
import '../../../slide_presentation/domain/entity/slide.dart';
import '../../domain/entity/project_slide_block.dart';
import '../../domain/entity/project_slide_entry.dart';

class ProjectSlideBlockSettings extends StatefulWidget {
  final ProjectSlideBlock slide;
  final ValueChanged<Slide> onChanged;

  const ProjectSlideBlockSettings({
    super.key,
    required this.slide,
    required this.onChanged,
  });

  @override
  State<ProjectSlideBlockSettings> createState() =>
      _ProjectSlideBlockSettingsState();
}

class _ProjectSlideBlockSettingsState extends State<ProjectSlideBlockSettings> {
  late Future<List<Project>> _futureProjects;
  late List<ProjectSlideEntry> _entries;

  @override
  void initState() {
    super.initState();
    _futureProjects = locator<GetProjectsUseCase>().execute();
    _entries = List<ProjectSlideEntry>.from(widget.slide.entries);
  }

  void _commit() {
    widget.onChanged(widget.slide.copyWithEntries(entries: _entries));
  }

  void _addEntry(Project project) {
    setState(() {
      _entries = [
        ..._entries,
        ProjectSlideEntry(project: project, objectifs: const []),
      ];
    });
    _commit();
  }

  void _removeEntry(int index) {
    setState(() {
      _entries = List<ProjectSlideEntry>.from(_entries)..removeAt(index);
    });
    _commit();
  }

  void _replaceEntry(int index, ProjectSlideEntry next) {
    setState(() {
      _entries = List<ProjectSlideEntry>.from(_entries);
      _entries[index] = next;
    });
    _commit();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Project>>(
      future: _futureProjects,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final allProjects = snapshot.data!;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            for (var i = 0; i < _entries.length; i++)
              _EntryCard(
                key: ValueKey('entry_$i'),
                entry: _entries[i],
                projects: allProjects,
                onChanged: (next) => _replaceEntry(i, next),
                onRemove: () => _removeEntry(i),
              ),
            const SizedBox(height: 8),
            _AddEntryButton(projects: allProjects, onPick: _addEntry),
          ],
        );
      },
    );
  }
}

class _EntryCard extends StatelessWidget {
  final ProjectSlideEntry entry;
  final List<Project> projects;
  final ValueChanged<ProjectSlideEntry> onChanged;
  final VoidCallback onRemove;

  const _EntryCard({
    super.key,
    required this.entry,
    required this.projects,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final selected = projects
        .where((p) => p.id == entry.project.id)
        .firstOrNull;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<Project>(
                    initialValue: selected,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Projet',
                    ),
                    items: [
                      for (final p in projects)
                        DropdownMenuItem(value: p, child: Text(p.name)),
                    ],
                    onChanged: (project) {
                      if (project == null) return;
                      onChanged(
                        ProjectSlideEntry(
                          project: project,
                          objectifs: const [],
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Retirer ce projet',
                  onPressed: onRemove,
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (selected != null)
              for (final objectif in selected.listObjectif)
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  value: entry.objectifs.any((o) => o.id == objectif.id),
                  onChanged: (checked) {
                    final exists = entry.objectifs.any(
                      (o) => o.id == objectif.id,
                    );
                    final nextObjectifs = exists
                        ? entry.objectifs
                              .where((o) => o.id != objectif.id)
                              .toList()
                        : [...entry.objectifs, objectif];
                    onChanged(entry.copyWith(objectifs: nextObjectifs));
                  },
                  title: Text(objectif.title),
                  subtitle: Text(
                    '${objectif.status.label} • '
                    'Échéance ${objectif.deadline.formattedDayMonth}',
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

class _AddEntryButton extends StatelessWidget {
  final List<Project> projects;
  final ValueChanged<Project> onPick;

  const _AddEntryButton({required this.projects, required this.onPick});

  Future<void> _open(BuildContext context) async {
    final picked = await showModalBottomSheet<Project>(
      context: context,
      builder: (_) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Ajouter un projet à la slide',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            for (final project in projects)
              ListTile(
                title: Text(project.name),
                onTap: () => Navigator.of(context).pop(project),
              ),
          ],
        ),
      ),
    );
    if (picked != null) onPick(picked);
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      icon: const Icon(Icons.add),
      label: const Text('Ajouter un projet'),
      onPressed: projects.isEmpty ? null : () => _open(context),
    );
  }
}
