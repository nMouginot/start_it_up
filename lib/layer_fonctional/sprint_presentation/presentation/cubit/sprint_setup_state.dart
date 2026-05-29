import '../../../projet/domain/entity/projet.dart';
import '../../domain/entity/sprint_presentation.dart';
import '../../domain/entity/sprint_timeframe.dart';

class SprintSetupState {
  final bool projetsLoading;
  final List<Projet> availableProjets;
  final Set<int> selectedProjetIds;
  final SprintTimeframe timeframe;
  final bool building;
  final SprintPresentation? builtPresentation;
  final Object? error;

  const SprintSetupState({
    required this.projetsLoading,
    required this.availableProjets,
    required this.selectedProjetIds,
    required this.timeframe,
    required this.building,
    required this.builtPresentation,
    required this.error,
  });

  factory SprintSetupState.initial() => SprintSetupState(
    projetsLoading: true,
    availableProjets: const [],
    selectedProjetIds: const {},
    timeframe: SprintTimeframe.currentWeek(),
    building: false,
    builtPresentation: null,
    error: null,
  );

  bool get canGenerate =>
      !building &&
      selectedProjetIds.isNotEmpty &&
      !timeframe.end.isBefore(timeframe.start);

  SprintSetupState copyWith({
    bool? projetsLoading,
    List<Projet>? availableProjets,
    Set<int>? selectedProjetIds,
    SprintTimeframe? timeframe,
    bool? building,
    SprintPresentation? builtPresentation,
    bool clearBuiltPresentation = false,
    Object? error,
    bool clearError = false,
  }) => SprintSetupState(
    projetsLoading: projetsLoading ?? this.projetsLoading,
    availableProjets: availableProjets ?? this.availableProjets,
    selectedProjetIds: selectedProjetIds ?? this.selectedProjetIds,
    timeframe: timeframe ?? this.timeframe,
    building: building ?? this.building,
    builtPresentation: clearBuiltPresentation
        ? null
        : builtPresentation ?? this.builtPresentation,
    error: clearError ? null : error ?? this.error,
  );
}
