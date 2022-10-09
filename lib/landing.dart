import 'package:flutter/material.dart';

import 'highlight_projects.dart';
import 'landing_label.dart';

class LandingViewData {
  LandingViewData({
    required this.imageUrl,
    required this.name,
    required this.description,
    this.role,
    required this.githubUrl,
    this.projects = const <ProjectViewData>[],
  });

  final String imageUrl;
  final String name;
  final String description;
  final String githubUrl;

  @Deprecated('Use [description] instead')
  final String? role;

  @Deprecated('Use [HighlightProjects] widget instead')
  final List<ProjectViewData> projects;
}

class LandingView extends StatelessWidget {
  const LandingView({
    Key? key,
    required this.data,
    this.footer,
    required this.highlightProjectsView,
    required this.experienceView,
    required this.blog,
  }) : super(key: key);

  final LandingViewData data;
  final Widget? footer;
  final Widget experienceView;
  final Widget highlightProjectsView;
  //Experimental
  final Widget blog;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black87,
      child: Column(
        children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Column(
                children: [
                  LandingLabel(data.imageUrl),
                  LandingLabel(data.name),
                  LandingLabel(data.description),
                  LandingLabel(data.githubUrl),
                  highlightProjectsView,
                  const LandingDivider(),
                  experienceView,
                  const LandingDivider(),
                  blog
                ],
              ),
            ),
          ),
          if (footer != null) footer!,
        ],
      ),
    );
  }
}

class LandingDivider extends StatelessWidget {
  const LandingDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Divider(
        height: 2,
        color: Colors.grey,
      ),
    );
  }
}
