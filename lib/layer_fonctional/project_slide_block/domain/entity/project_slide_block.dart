import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../../objectif/domain/entity/objectif.dart';
import '../../../project/domain/entity/project.dart';
import '../../../project/domain/use_case/get_projects_use_case.dart';
import '../../../slide_presentation/domain/entity/slide.dart';
import '../../../slide_presentation/domain/entity/slide_instance_id.dart';
import '../../../slide_presentation/domain/entity/slide_template.dart';
import '../../../slide_presentation/domain/entity/timeframe.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../../../theme/presentation/widget/slide_shell.dart';

class ProjectSlideBlock extends Slide {
  final Project? project;
  final List<Objectif> objectifs;

  factory ProjectSlideBlock({
    Key? key,
    String? instanceId,
    int pageNumber = 1,
    int totalPages = 1,
    required Timeframe timeframe,
    required SlideTheme theme,
    Project? project,
    List<Objectif> objectifs = const [],
  }) => ProjectSlideBlock._(
    key: key,
    instanceId: instanceId ?? newSlideInstanceId(),
    pageNumber: pageNumber,
    totalPages: totalPages,
    timeframe: timeframe,
    theme: theme,
    project: project,
    objectifs: objectifs,
  );

  ProjectSlideBlock._({
    super.key,
    required super.instanceId,
    required super.pageNumber,
    required super.totalPages,
    required super.timeframe,
    required super.theme,
    required this.project,
    required this.objectifs,
  }) : super(
         configuration: FlutterDeckSlideConfiguration(
           route: '/project-$instanceId',
         ),
       );

  static const String templateKeyValue = 'project_block';

  static SlideTemplate template = SlideTemplate(
    key: templateKeyValue,
    label: 'Projet',
    icon: Icons.folder,
    createDefault: ({required timeframe, required theme}) =>
        ProjectSlideBlock(timeframe: timeframe, theme: theme),
  );

  @override
  String get templateKey => templateKeyValue;

  @override
  String get summary => project == null
      ? 'Aucun projet sélectionné'
      : '${project!.name} • ${objectifs.length} objectif(s)';

  @override
  ProjectSlideBlock copyWithCore({
    int? pageNumber,
    int? totalPages,
    Timeframe? timeframe,
    SlideTheme? theme,
  }) => ProjectSlideBlock._(
    instanceId: instanceId,
    pageNumber: pageNumber ?? this.pageNumber,
    totalPages: totalPages ?? this.totalPages,
    timeframe: timeframe ?? this.timeframe,
    theme: theme ?? this.theme,
    project: project,
    objectifs: objectifs,
  );

  ProjectSlideBlock copyWithSelection({
    required Project? project,
    required List<Objectif> objectifs,
  }) => ProjectSlideBlock._(
    instanceId: instanceId,
    pageNumber: pageNumber,
    totalPages: totalPages,
    timeframe: timeframe,
    theme: theme,
    project: project,
    objectifs: objectifs,
  );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (_) => SlideShell(
        theme: theme,
        pageNumber: pageNumber,
        totalPages: totalPages,
        child: project == null
            ? Center(
                child: Text(
                  'Aucun projet sélectionné',
                  style: theme.headline(),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project!.name, style: theme.display()),
                  const SizedBox(height: 8),
                  Text(
                    'Version ${project!.version}',
                    style: theme.title(color: theme.colors.accentColor),
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: objectifs.isEmpty
                        ? Center(
                            child: Text(
                              'Aucun objectif pour ce sprint.',
                              style: theme.body(),
                            ),
                          )
                        : ListView.separated(
                            itemCount: objectifs.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            itemBuilder: (_, index) => _ObjectifRow(
                              theme: theme,
                              objectif: objectifs[index],
                            ),
                          ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget buildSettings(BuildContext context, ValueChanged<Slide> onChanged) {
    return _ProjectSlideBlockSettings(slide: this, onChanged: onChanged);
  }
}

class _ProjectSlideBlockSettings extends StatefulWidget {
  final ProjectSlideBlock slide;
  final ValueChanged<Slide> onChanged;

  const _ProjectSlideBlockSettings({
    required this.slide,
    required this.onChanged,
  });

  @override
  State<_ProjectSlideBlockSettings> createState() =>
      _ProjectSlideBlockSettingsState();
}

class _ProjectSlideBlockSettingsState
    extends State<_ProjectSlideBlockSettings> {
  late Future<List<Project>> _futureProjects;
  late Project? _selectedProject;
  late List<Objectif> _selectedObjectifs;

  @override
  void initState() {
    super.initState();
    _futureProjects = locator<GetProjectsUseCase>().execute();
    _selectedProject = widget.slide.project;
    _selectedObjectifs = List<Objectif>.from(widget.slide.objectifs);
  }

  void _commit() {
    widget.onChanged(
      widget.slide.copyWithSelection(
        project: _selectedProject,
        objectifs: _selectedObjectifs,
      ),
    );
  }

  void _onProjectChanged(Project? project) {
    setState(() {
      _selectedProject = project;
      _selectedObjectifs = const [];
    });
    _commit();
  }

  void _toggleObjectif(Objectif objectif) {
    setState(() {
      final exists = _selectedObjectifs.any((o) => o.id == objectif.id);
      _selectedObjectifs = exists
          ? _selectedObjectifs.where((o) => o.id != objectif.id).toList()
          : [..._selectedObjectifs, objectif];
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
        final projects = snapshot.data!;
        final currentProject = _selectedProject == null
            ? null
            : projects
                  .where((p) => p.id == _selectedProject!.id)
                  .firstOrNull;
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Projet', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            DropdownButtonFormField<Project?>(
              initialValue: currentProject,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: [
                const DropdownMenuItem<Project?>(
                  value: null,
                  child: Text('— Aucun —'),
                ),
                ...projects.map(
                  (p) => DropdownMenuItem<Project?>(value: p, child: Text(p.name)),
                ),
              ],
              onChanged: _onProjectChanged,
            ),
            const SizedBox(height: 24),
            if (currentProject != null) ...[
              Text(
                'Objectifs',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              for (final objectif in currentProject.listObjectif)
                CheckboxListTile(
                  value: _selectedObjectifs.any((o) => o.id == objectif.id),
                  onChanged: (_) => _toggleObjectif(objectif),
                  title: Text(objectif.title),
                  subtitle: Text(
                    '${objectif.status.label} • '
                    'Échéance ${objectif.deadline.formattedDayMonth}',
                  ),
                ),
            ],
          ],
        );
      },
    );
  }
}

class _ObjectifRow extends StatelessWidget {
  final SlideTheme theme;
  final Objectif objectif;

  const _ObjectifRow({required this.theme, required this.objectif});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colors.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(objectif.title, style: theme.title()),
          const SizedBox(height: 4),
          Text(objectif.description, style: theme.body()),
          const SizedBox(height: 8),
          Row(
            children: [
              _Badge(theme: theme, label: objectif.status.label),
              const SizedBox(width: 8),
              _Badge(
                theme: theme,
                label: 'Échéance : ${objectif.deadline.formattedDayMonth}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final SlideTheme theme;
  final String label;
  const _Badge({required this.theme, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colors.primaryColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(label, style: theme.body(color: theme.colors.primaryColor)),
    );
  }
}
