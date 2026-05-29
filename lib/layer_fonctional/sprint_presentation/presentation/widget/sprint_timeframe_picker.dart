import 'package:flutter/material.dart';

import '../../../../layer_technical/extension/date_time_extension.dart';
import '../../domain/entity/sprint_timeframe.dart';

class SprintTimeframePicker extends StatelessWidget {
  final SprintTimeframe timeframe;
  final ValueChanged<SprintTimeframe> onChanged;

  const SprintTimeframePicker({
    super.key,
    required this.timeframe,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DateField(
            label: 'Début',
            date: timeframe.start,
            onPicked: (picked) =>
                onChanged(timeframe.copyWith(start: picked)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _DateField(
            label: 'Fin',
            date: timeframe.end,
            onPicked: (picked) => onChanged(timeframe.copyWith(end: picked)),
          ),
        ),
      ],
    );
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final DateTime date;
  final ValueChanged<DateTime> onPicked;

  const _DateField({
    required this.label,
    required this.date,
    required this.onPicked,
  });

  Future<void> _pick(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(date.year - 2),
      lastDate: DateTime(date.year + 2),
    );
    if (picked != null) onPicked(picked);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pick(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        child: Text(date.formattedDayMonthYear),
      ),
    );
  }
}
