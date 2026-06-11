/// Reads and writes one raw JSON string per collection.
abstract interface class HistoryStorage {
  Future<void> write(String collection, String json);
  Future<String?> read(String collection);
}
