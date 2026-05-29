import '../../../../projet/domain/entity/projet.dart';

class ObjectifCreateState {
  final bool projetsLoading;
  final List<Projet> availableProjets;
  final int? selectedProjetId;
  final String title;
  final String description;
  final DateTime deadline;
  final bool submitting;
  final bool submitted;
  final Object? error;

  const ObjectifCreateState({
    required this.projetsLoading,
    required this.availableProjets,
    required this.selectedProjetId,
    required this.title,
    required this.description,
    required this.deadline,
    required this.submitting,
    required this.submitted,
    required this.error,
  });

  factory ObjectifCreateState.initial({int? initialProjetId}) {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return ObjectifCreateState(
      projetsLoading: true,
      availableProjets: const [],
      selectedProjetId: initialProjetId,
      title: '',
      description: '',
      deadline: DateTime(tomorrow.year, tomorrow.month, tomorrow.day),
      submitting: false,
      submitted: false,
      error: null,
    );
  }

  bool get canSubmit =>
      !submitting &&
      selectedProjetId != null &&
      title.trim().isNotEmpty &&
      description.trim().isNotEmpty;

  ObjectifCreateState copyWith({
    bool? projetsLoading,
    List<Projet>? availableProjets,
    int? selectedProjetId,
    String? title,
    String? description,
    DateTime? deadline,
    bool? submitting,
    bool? submitted,
    Object? error,
    bool clearError = false,
  }) => ObjectifCreateState(
    projetsLoading: projetsLoading ?? this.projetsLoading,
    availableProjets: availableProjets ?? this.availableProjets,
    selectedProjetId: selectedProjetId ?? this.selectedProjetId,
    title: title ?? this.title,
    description: description ?? this.description,
    deadline: deadline ?? this.deadline,
    submitting: submitting ?? this.submitting,
    submitted: submitted ?? this.submitted,
    error: clearError ? null : error ?? this.error,
  );
}
