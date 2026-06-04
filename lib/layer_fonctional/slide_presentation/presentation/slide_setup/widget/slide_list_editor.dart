import 'package:flutter/material.dart';

import '../../../domain/entity/slide.dart';
import '../../../domain/entity/slide_template.dart';
import '../../slide_settings/slide_settings_page.dart';
import '../cubit/slide_setup_cubit.dart';

class SlideListEditor extends StatelessWidget {
  final SlideSetupCubit cubit;
  final List<Slide> slides;
  final List<SlideTemplate> templates;

  const SlideListEditor({
    super.key,
    required this.cubit,
    required this.slides,
    required this.templates,
  });

  void _openSettings(BuildContext context, Slide slide) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            SlideSettingsPage(cubit: cubit, instanceId: slide.instanceId),
      ),
    );
  }

  Future<void> _openAddSheet(BuildContext context) async {
    final picked = await showModalBottomSheet<SlideTemplate>(
      context: context,
      builder: (_) => _TemplatePickerSheet(templates: templates),
    );
    if (picked != null) cubit.addSlide(picked);
  }

  IconData _iconForTemplate(String key) {
    final template = templates.where((t) => t.key == key).firstOrNull;
    return template?.icon ?? Icons.slideshow;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (slides.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Text('Aucune slide. Ajoutez-en une pour commencer.'),
          )
        else
          ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: slides.length,
            onReorder: cubit.reorderSlide,
            itemBuilder: (context, index) {
              final slide = slides[index];
              return Card(
                key: ValueKey(slide.instanceId),
                child: ListTile(
                  leading: Icon(_iconForTemplate(slide.templateKey)),
                  title: Text(slide.templateKey),
                  subtitle: Text(slide.summary),
                  onTap: () => _openSettings(context, slide),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.copy),
                        tooltip: 'Dupliquer',
                        onPressed: () => cubit.duplicateSlide(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline),
                        tooltip: 'Supprimer',
                        onPressed: () => cubit.removeSlide(index),
                      ),
                      ReorderableDragStartListener(
                        index: index,
                        child: const Icon(Icons.drag_handle),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        const SizedBox(height: 12),
        FilledButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Ajouter une slide'),
          onPressed: () => _openAddSheet(context),
        ),
      ],
    );
  }
}

class _TemplatePickerSheet extends StatelessWidget {
  final List<SlideTemplate> templates;

  const _TemplatePickerSheet({required this.templates});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Choisir un type de slide',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          for (final template in templates)
            ListTile(
              leading: Icon(template.icon),
              title: Text(template.label),
              onTap: () => Navigator.of(context).pop(template),
            ),
        ],
      ),
    );
  }
}
