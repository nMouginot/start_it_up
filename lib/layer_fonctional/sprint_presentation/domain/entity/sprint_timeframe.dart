import 'package:copy_with_extension/copy_with_extension.dart';

part 'sprint_timeframe.g.dart';

@CopyWith()
class SprintTimeframe {
  final DateTime start;

  final DateTime end;

  const SprintTimeframe({required this.start, required this.end});

  /// Default to the current ISO week (Monday → Sunday).
  factory SprintTimeframe.currentWeek({DateTime? now}) {
    final reference = now ?? DateTime.now();
    final today = DateTime(reference.year, reference.month, reference.day);
    final monday = today.subtract(Duration(days: today.weekday - 1));
    final sunday = monday.add(const Duration(days: 6));
    return SprintTimeframe(start: monday, end: sunday);
  }

  Duration get duration => end.difference(start);

  bool contains(DateTime moment) {
    final dayStart = DateTime(start.year, start.month, start.day);
    final dayEnd = DateTime(end.year, end.month, end.day, 23, 59, 59);
    return !moment.isBefore(dayStart) && !moment.isAfter(dayEnd);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SprintTimeframe && other.start == start && other.end == end;
  }

  @override
  int get hashCode => Object.hash(start, end);
}
