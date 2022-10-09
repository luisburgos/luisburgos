import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'landing_label.dart';

class ProjectViewData {
  ProjectViewData({
    required this.name,
    required this.githubUrl,
  });

  final String name;
  final String githubUrl;

  static ProjectViewData fromJson(Map json) {
    return ProjectViewData(
      name: json['name'],
      githubUrl: json['github_url'],
    );
  }
}

class HighlightProjectsView extends StatelessWidget {
  const HighlightProjectsView(
    this.projects, {
    Key? key,
  }) : super(key: key);

  final List<ProjectViewData> projects;

  @override
  Widget build(BuildContext context) {
    return ProjectsListView(
      projects: projects,
      onGithubUrlTap: (url) async {
        //TODO: Refactor to move logic out af the view.
        final uri = Uri.parse(url);
        if (!await launchUrl(uri)) {
          throw 'Could not launch $url';
        }
      },
    );
  }
}

class ProjectsListView extends StatelessWidget {
  const ProjectsListView({
    Key? key,
    this.projects = const <ProjectViewData>[],
    required this.onGithubUrlTap,
  }) : super(key: key);

  final List<ProjectViewData> projects;
  final Function(String) onGithubUrlTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final data = projects[index];
        return ProjectViewItem(
          data: data,
          onGithubUrlTap: onGithubUrlTap,
        );
      },
    );
  }
}

class ProjectViewItem extends StatelessWidget {
  const ProjectViewItem({
    Key? key,
    required this.data,
    required this.onGithubUrlTap,
  }) : super(key: key);

  final Function(String) onGithubUrlTap;
  final ProjectViewData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: LandingLabel(data.name),
        trailing: ElevatedButton(
          onPressed: () => onGithubUrlTap(data.githubUrl),
          child: Text(data.githubUrl),
        ),
      ),
    );
  }
}
