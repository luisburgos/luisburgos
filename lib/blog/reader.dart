import 'package:flutter/services.dart';
import 'package:markdown/markdown.dart';

abstract class MarkdownParser<T> {
  T parse(dynamic data);
}

class MarkdownReader<T> {
  MarkdownReader({
    required this.fileName,
    required this.parser,
  });

  final String fileName;
  final MarkdownParser<T> parser;

  Future<T> read() async {
    final data = await rootBundle.loadString(fileName);
    var markdownData = markdownToHtml(data, encodeHtml: false);
    return parser.parse(markdownData);
  }
}
