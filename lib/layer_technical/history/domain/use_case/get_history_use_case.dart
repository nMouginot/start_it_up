import 'dart:convert';

import '../storage/history_storage.dart';

class GetHistoryUseCase {
  final HistoryStorage _storage;

  const GetHistoryUseCase({required HistoryStorage storage})
    : _storage = storage;

  Future<List<T>> execute<T>({
    required String collection,
    required T Function(Map<String, dynamic> json) fromJson,
  }) async {
    final raw = await _storage.read(collection);
    if (raw == null) return const [];
    final documents = jsonDecode(raw) as List<dynamic>;
    return documents.cast<Map<String, dynamic>>().map(fromJson).toList();
  }
}
