import '../../../theme/domain/entity/slide_theme.dart';
import 'slide.dart';

class SlidePresentation {
  final List<Slide> slides;
  final SlideTheme theme;

  const SlidePresentation({required this.slides, required this.theme});
}
