import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

abstract class YamlParser<T> {
  T parse(YamlMap data);
}

class YamlReader<T> {
  YamlReader({
    required this.fileName,
    required this.parser,
  });

  final String fileName;
  final YamlParser<T> parser;

  Future<T> read() async {
    final data = await rootBundle.loadString(fileName);
    var yamlData = loadYaml(data);
    return parser.parse(yamlData);
  }
}
