import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/entity/slide_theme.dart';

class SlideThemePicker extends StatelessWidget {
  final SlideTheme theme;
  final String currentJson;
  final ValueChanged<String> onImport;
  final VoidCallback onReset;

  const SlideThemePicker({
    super.key,
    required this.theme,
    required this.currentJson,
    required this.onImport,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Thème', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            _ThemePreview(theme: theme),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.file_upload),
                  label: const Text('Importer JSON'),
                  onPressed: () => _openImportDialog(context),
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.file_download),
                  label: const Text('Exporter JSON'),
                  onPressed: () => _openExportDialog(context),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Réinitialiser'),
                  onPressed: onReset,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openImportDialog(BuildContext context) async {
    final controller = TextEditingController(text: currentJson);
    final raw = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Importer un thème'),
        content: SizedBox(
          width: 520,
          child: TextField(
            controller: controller,
            maxLines: 16,
            minLines: 8,
            style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText:
                  '{ "colors": { ... }, "typography": { ... }, "assets": { ... } }',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Annuler'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(controller.text),
            child: const Text('Importer'),
          ),
        ],
      ),
    );
    if (raw != null && raw.trim().isNotEmpty) onImport(raw);
  }

  Future<void> _openExportDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Exporter le thème'),
        content: SizedBox(
          width: 520,
          child: SingleChildScrollView(
            child: SelectableText(
              currentJson,
              style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            ),
          ),
        ),
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.copy),
            label: const Text('Copier'),
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: currentJson));
              if (dialogContext.mounted) Navigator.of(dialogContext).pop();
            },
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }
}

class _ThemePreview extends StatelessWidget {
  final SlideTheme theme;

  const _ThemePreview({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _Swatch(color: theme.colors.primaryColor, label: 'P'),
          const SizedBox(width: 8),
          _Swatch(color: theme.colors.accentColor, label: 'A'),
          const SizedBox(width: 8),
          _Swatch(color: theme.colors.surfaceColor, label: 'S'),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              '${theme.typography.fontFamily} • '
              '${theme.assets.logoUrl != null ? 'logo' : 'pas de logo'} • '
              '${theme.assets.backgroundImageUrl != null ? 'fond image' : 'fond uni'}',
              style: TextStyle(color: theme.colors.textColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  final Color color;
  final String label;

  const _Swatch({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
