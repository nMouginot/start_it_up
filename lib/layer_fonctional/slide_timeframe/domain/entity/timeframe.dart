import 'package:copy_with_extension/copy_with_extension.dart';

part 'timeframe.g.dart';

@CopyWith()
class Timeframe {
  final DateTime start;
  final DateTime end;

  const Timeframe({required this.start, required this.end});

  factory Timeframe.currentWeek({DateTime? now}) {
    final reference = now ?? DateTime.now();
    final today = DateTime(reference.year, reference.month, reference.day);
    final monday = today.subtract(Duration(days: today.weekday - 1));
    final sunday = monday.add(const Duration(days: 6));
    return Timeframe(start: monday, end: sunday);
  }
}
