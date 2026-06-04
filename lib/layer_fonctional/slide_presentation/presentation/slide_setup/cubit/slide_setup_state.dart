import 'package:copy_with_extension/copy_with_extension.dart';

import '../../../../theme/domain/entity/slide_theme.dart';
import '../../../domain/entity/slide.dart';
import '../../../domain/entity/slide_presentation.dart';
import '../../../domain/entity/slide_template.dart';
import '../../../domain/entity/timeframe.dart';

part 'slide_setup_state.g.dart';

@CopyWith()
class SlideSetupState {
  final bool loading;
  final List<Slide> slides;
  final List<SlideTemplate> templates;
  final Timeframe timeframe;
  final SlideTheme theme;
  final bool building;
  final SlidePresentation? builtPresentation;
  final Object? error;
  final String exportJson;

  const SlideSetupState({
    required this.loading,
    required this.slides,
    required this.templates,
    required this.timeframe,
    required this.theme,
    required this.building,
    required this.builtPresentation,
    required this.error,
    required this.exportJson,
  });

  factory SlideSetupState.initial({
    List<SlideTemplate> templates = const [],
  }) => SlideSetupState(
    loading: true,
    slides: const [],
    templates: templates,
    timeframe: Timeframe.currentWeek(),
    theme: const SlideTheme.defaults(),
    building: false,
    builtPresentation: null,
    error: null,
    exportJson: '',
  );

  bool get hasValidTimeframe => !timeframe.end.isBefore(timeframe.start);

  bool get canGenerate => !building && slides.isNotEmpty && hasValidTimeframe;

  bool get canLaunch => builtPresentation != null && !building;
}
