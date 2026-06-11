import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../../slide_presentation/domain/entity/slide.dart';
import '../../../slide_presentation/domain/entity/slide_instance_id.dart';
import '../../../slide_presentation/domain/entity/slide_template.dart';
import '../../../slide_presentation/domain/entity/timeframe.dart';
import '../../../theme/domain/entity/slide_theme.dart';
import '../../../theme/presentation/widget/slide_shell.dart';
import '../../../theme/presentation/widget/theme_image_source.dart';

class SlideTimeframe extends Slide {
  factory SlideTimeframe({
    Key? key,
    String? instanceId,
    int pageNumber = 1,
    int totalPages = 1,
    required Timeframe timeframe,
    required SlideTheme theme,
  }) => SlideTimeframe._(
    key: key,
    instanceId: instanceId ?? newSlideInstanceId(),
    pageNumber: pageNumber,
    totalPages: totalPages,
    timeframe: timeframe,
    theme: theme,
  );

  SlideTimeframe._({
    super.key,
    required super.instanceId,
    required super.pageNumber,
    required super.totalPages,
    required super.timeframe,
    required super.theme,
  }) : super(
         configuration: FlutterDeckSlideConfiguration(
           route: '/intro-$instanceId',
         ),
       );

  static const String templateKeyValue = 'intro';

  static SlideTemplate template = SlideTemplate(
    key: templateKeyValue,
    label: 'Intro',
    icon: Icons.flag,
    createDefault: ({required timeframe, required theme}) =>
        SlideTimeframe(timeframe: timeframe, theme: theme),
  );

  @override
  String get templateKey => templateKeyValue;

  @override
  String get summary =>
      'Du ${timeframe.start.formattedDayMonthYear} au ${timeframe.end.formattedDayMonthYear}';

  @override
  SlideTimeframe copyWithCore({
    int? pageNumber,
    int? totalPages,
    Timeframe? timeframe,
    SlideTheme? theme,
  }) => SlideTimeframe._(
    instanceId: instanceId,
    pageNumber: pageNumber ?? this.pageNumber,
    totalPages: totalPages ?? this.totalPages,
    timeframe: timeframe ?? this.timeframe,
    theme: theme ?? this.theme,
  );

  @override
  FlutterDeckSlide build(BuildContext context) {
    final logo = theme.assets.logoUrl;
    return FlutterDeckSlide.blank(
      builder: (_) => SlideShell(
        theme: theme,
        pageNumber: pageNumber,
        totalPages: totalPages,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sprint Review', style: theme.display()),
                  const SizedBox(height: 24),
                  Text(
                    summary,
                    style: theme.headline(color: theme.colors.accentColor),
                  ),
                ],
              ),
            ),
            if (logo != null)
              Positioned(top: 0, right: 0, child: themeImage(logo, height: 72)),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSettings(BuildContext context, ValueChanged<Slide> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aucun réglage spécifique.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'La période vient des réglages globaux de la présentation.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
