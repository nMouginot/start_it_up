import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../project/domain/entity/project.dart';
import '../../../domain/entity/objectif.dart';

part 'objectif_form_state.g.dart';

@CopyWith()
class ObjectifFormState {
  final bool projectsLoading;
  final List<Project> availableProjects;

  final Objectif? existing;

  final int? selectedProjectId;
  final String title;
  final String description;
  final DateTime deadline;

  final bool submitting;
  final bool submitted;
  final Object? error;

  const ObjectifFormState({
    required this.projectsLoading,
    required this.availableProjects,
    required this.existing,
    required this.selectedProjectId,
    required this.title,
    required this.description,
    required this.deadline,
    required this.submitting,
    required this.submitted,
    required this.error,
  });

  factory ObjectifFormState.initial({
    int? initialProjectId,
    Objectif? existing,
  }) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return ObjectifFormState(
      projectsLoading: true,
      availableProjects: const [],
      existing: existing,
      selectedProjectId: initialProjectId,
      title: existing?.title ?? '',
      description: existing?.description ?? '',
      deadline:
          existing?.deadline ??
          DateTime(tomorrow.year, tomorrow.month, tomorrow.day),
      submitting: false,
      submitted: false,
      error: null,
    );
  }

  bool get isEditing => existing != null;

  bool get canSubmit =>
      !submitting &&
      (isEditing || selectedProjectId != null) &&
      title.trim().isNotEmpty &&
      description.trim().isNotEmpty;
}
