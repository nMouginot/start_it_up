import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../slide_setup/cubit/slide_setup_cubit.dart';
import '../slide_setup/cubit/slide_setup_state.dart';

class SlideSettingsPage extends StatelessWidget {
  final SlideSetupCubit cubit;
  final String instanceId;

  const SlideSettingsPage({
    super.key,
    required this.cubit,
    required this.instanceId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SlideSetupCubit>.value(
      value: cubit,
      child: BlocBuilder<SlideSetupCubit, SlideSetupState>(
        builder: (context, state) {
          final index = state.slides.indexWhere(
            (s) => s.instanceId == instanceId,
          );
          if (index == -1) {
            return Scaffold(
              appBar: AppBar(title: const Text('Slide introuvable')),
              body: const Center(child: Text('Cette slide n\'existe plus.')),
            );
          }
          final slide = state.slides[index];
          return Scaffold(
            appBar: AppBar(title: Text('Réglages — ${slide.templateKey}')),
            body: slide.buildSettings(
              context,
              (updated) => cubit.replaceSlide(index, updated),
            ),
          );
        },
      ),
    );
  }
}
