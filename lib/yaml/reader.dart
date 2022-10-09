import 'dart:convert';

import "package:flutter/services.dart";
import 'package:luisburgos/experience.dart';
import 'package:yaml/yaml.dart';

class SiteModel {
  String imageUrl;
  String name;
  String description;
  String githubUrl;
  List<ExperienceViewData> experiences;

  SiteModel.fromJson(Map json)
      : name = json['name'],
        imageUrl = json['image_url'],
        description = json['description'],
        githubUrl = json['github_url'],
        experiences = (json['experiences'] as List)
            .map((e) => ExperienceViewData.fromJson(e))
            .toList();
}

class SiteYamlParser extends YamlParser<SiteModel> {
  @override
  SiteModel parse(YamlMap data) {
    final yamlEncode = jsonEncode(data);
    final yamlDecode = jsonDecode(yamlEncode);
    return SiteModel.fromJson(yamlDecode);
  }
}

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
