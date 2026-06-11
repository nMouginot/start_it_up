import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../domain/storage/history_storage.dart';

/// Stores each collection as a `history/<collection>.json` file on disk.
class HistoryFileStorage implements HistoryStorage {
  Future<File> _file(String collection) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/history/$collection.json');
  }

  @override
  Future<void> write(String collection, String json) async {
    final file = await _file(collection);
    await file.create(recursive: true);
    await file.writeAsString(json);
  }

  @override
  Future<String?> read(String collection) async {
    final file = await _file(collection);
    if (!await file.exists()) return null;
    return file.readAsString();
  }
}

HistoryStorage createHistoryStorage() => HistoryFileStorage();
