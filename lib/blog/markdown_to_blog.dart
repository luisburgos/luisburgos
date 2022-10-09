import 'dart:convert';

import 'reader.dart';

class BlogModel {
  String title;
  String subtitle;

  BlogModel.fromJson(Map json)
      : title = json['title'],
        subtitle = json['subtitle'];
}

class MarkdownBlogParser extends MarkdownParser<BlogModel> {
  @override
  BlogModel parse(dynamic data) {
    final encoded = jsonEncode(data);
    final decoded = jsonDecode(encoded);
    return BlogModel.fromJson(decoded);
  }
}
