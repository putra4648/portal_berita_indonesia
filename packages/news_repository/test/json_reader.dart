import 'dart:io';

class JsonReader {
  static String read() {
    final jsonPath = '${Directory.current.path}/test/response.json';
    return File(jsonPath).readAsStringSync();
  }
}
