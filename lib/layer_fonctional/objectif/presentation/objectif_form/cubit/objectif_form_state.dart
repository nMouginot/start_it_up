import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../projet/domain/entity/projet.dart';
import '../../../domain/entity/objectif.dart';

part 'objectif_form_state.g.dart';

@CopyWith()
class ObjectifFormState {
  final bool projetsLoading;
  final List<Projet> availableProjets;

  /// When non-null, the form is in edit mode for that objectif.
  final Objectif? existing;

  final int? selectedProjetId;
  final String title;
  final String description;
  final DateTime deadline;

  final bool submitting;
  final bool submitted;
  final Object? error;

  const ObjectifFormState({
    required this.projetsLoading,
    required this.availableProjets,
    required this.existing,
    required this.selectedProjetId,
    required this.title,
    required this.description,
    required this.deadline,
    required this.submitting,
    required this.submitted,
    required this.error,
  });

  factory ObjectifFormState.initial({
    int? initialProjetId,
    Objectif? existing,
  }) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return ObjectifFormState(
      projetsLoading: true,
      availableProjets: const [],
      existing: existing,
      selectedProjetId: existing?.projetId ?? initialProjetId,
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
      selectedProjetId != null &&
      title.trim().isNotEmpty &&
      description.trim().isNotEmpty;
}
