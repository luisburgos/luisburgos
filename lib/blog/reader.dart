import 'package:flutter/services.dart';

class MarkdownReader {
  MarkdownReader({
    required this.fileName,
  });

  final String fileName;

  Future<String> read() {
    return rootBundle.loadString(fileName);
  }
}
