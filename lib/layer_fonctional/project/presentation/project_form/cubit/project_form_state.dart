import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../domain/entity/project.dart';

part 'project_form_state.g.dart';

@CopyWith()
class ProjectFormState {
  final Project? existing;
  final String name;
  final String version;
  final bool submitting;
  final bool submitted;
  final Object? error;

  const ProjectFormState({
    required this.existing,
    required this.name,
    required this.version,
    required this.submitting,
    required this.submitted,
    required this.error,
  });

  factory ProjectFormState.initial({Project? existing}) => ProjectFormState(
    existing: existing,
    name: existing?.name ?? '',
    version: existing?.version ?? '0.1.0',
    submitting: false,
    submitted: false,
    error: null,
  );

  bool get isEditing => existing != null;

  bool get canSubmit =>
      !submitting && name.trim().isNotEmpty && version.trim().isNotEmpty;
}
