import 'dart:convert';

import '../storage/history_storage.dart';

class SaveHistoryUseCase {
  final HistoryStorage _storage;

  const SaveHistoryUseCase({required HistoryStorage storage})
    : _storage = storage;

  Future<void> execute<T>({
    required String collection,
    required List<T> items,
    required Map<String, dynamic> Function(T item) toJson,
  }) => _storage.write(collection, jsonEncode(items.map(toJson).toList()));
}
