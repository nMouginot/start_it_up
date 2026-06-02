import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layer_technical/dependency_injection/app_dependency_injection.dart';
import '../../../slide_presentation_history/domain/use_case/get_slide_presentation_history_use_case.dart';
import '../presentation_launcher.dart';
import 'cubit/slide_launcher_cubit.dart';
import 'cubit/slide_launcher_state.dart';

class SlideLauncherPage extends StatelessWidget {
  final int historyEntryId;

  const SlideLauncherPage({super.key, required this.historyEntryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SlideLauncherCubit(
        getHistoryUseCase: locator<GetSlidePresentationHistoryUseCase>(),
        presentationLauncher: locator<PresentationLauncher>(),
      )..launch(historyEntryId),
      child: const _SlideLauncherView(),
    );
  }
}

class _SlideLauncherView extends StatelessWidget {
  const _SlideLauncherView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SlideLauncherCubit, SlideLauncherState>(
          builder: (context, state) => switch (state) {
            SlideLauncherLoading() || SlideLauncherStarted() => const Center(
              child: CircularProgressIndicator(),
            ),
            SlideLauncherNotFound() => const Center(
              child: Text('Présentation introuvable.'),
            ),
            SlideLauncherError(:final error) => Center(
              child: Text('Erreur : $error'),
            ),
          },
        ),
      ),
    );
  }
}
