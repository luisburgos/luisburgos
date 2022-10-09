import 'dart:convert';

import 'package:yaml/yaml.dart';

import '../experience.dart';
import '../highlight_projects.dart';
import 'reader.dart';

class SiteModel {
  String imageUrl;
  String name;
  String description;
  String githubUrl;
  List<ProjectViewData> projects;
  List<ExperienceViewData> experiences;

  SiteModel.fromJson(Map json)
      : name = json['name'],
        imageUrl = json['image_url'],
        description = json['description'],
        githubUrl = json['github_url'],
        projects = (json['projects'] as List)
            .map((e) => ProjectViewData.fromJson(e))
            .toList(),
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
