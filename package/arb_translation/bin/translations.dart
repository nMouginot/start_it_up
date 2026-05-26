import 'package:path/path.dart' as path;
import 'dart:io';

Future<void> main() async {
  final filePaths = await findFilesWithTranslationBuilder();

  if (filePaths.isNotEmpty) {
    runDartFile(filePaths.first);
  }
}

/// Finds all Dart files in lib folder containing 'TranslationBuilder.create()'
Future<List<String>> findFilesWithTranslationBuilder() async {
  final libDir = Directory('lib');

  if (!await libDir.exists()) {
    throw Exception("Can't find the Directory 'lib' in the project");
  }

  final result = <String>[];
  final files = await _getAllDartFiles(libDir);

  for (final file in files) {
    final content = await file.readAsString();
    if (content.contains('TranslationBuilder.create(')) {
      result.add(file.path);
    }
  }

  return result;
}

/// Recursively finds all Dart files in a directory
Future<List<File>> _getAllDartFiles(Directory dir) async {
  final files = <File>[];

  await for (final entity in dir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      files.add(entity);
    }
  }

  return files;
}

Future runDartFile(String filePath) async {
  final relativePath = path.relative(filePath);

  final process = await Process.run('dart', [
    'run',
    relativePath,
  ], runInShell: true);

  if (process.stderr.isNotEmpty) {
    throw Exception('Errors: ${process.stderr}');
  }
}
