import 'package:web/web.dart';

import '../../domain/storage/history_storage.dart';

/// Stores each collection under a `history/<collection>` key in localStorage.
class HistoryLocalStorage implements HistoryStorage {
  String _key(String collection) => 'history/$collection';

  @override
  Future<void> write(String collection, String json) async {
    window.localStorage.setItem(_key(collection), json);
  }

  @override
  Future<String?> read(String collection) async {
    return window.localStorage.getItem(_key(collection));
  }
}

HistoryStorage createHistoryStorage() => HistoryLocalStorage();
