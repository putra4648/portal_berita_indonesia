import 'dart:io';

class JsonReader {
  static String read(String filename) {
    final jsonPath = '${Directory.current.path}/test/$filename.json';
    return File(jsonPath).readAsStringSync();
  }
}
