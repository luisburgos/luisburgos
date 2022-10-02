import 'package:flutter/material.dart';

import 'landing_label.dart';
import 'landing_project.dart';

class LandingViewData {
  LandingViewData({
    required this.imageUrl,
    required this.name,
    required this.description,
    this.role,
    required this.githubUrl,
    this.projects = const <LandingProjectViewData>[],
  });

  final String imageUrl;
  final String name;
  final String description;
  final String githubUrl;

  @Deprecated('Use [description] instead')
  final String? role;

  @Deprecated('Use [HighlightProjects] widget instead')
  final List<LandingProjectViewData> projects;
}

class LandingView extends StatelessWidget {
  const LandingView({
    Key? key,
    required this.data,
    this.footer,
    required this.highlightProjectsView,
    required this.experienceView,
  }) : super(key: key);

  final LandingViewData data;
  final Widget? footer;
  final Widget experienceView;
  final Widget highlightProjectsView;

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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Divider(height: 1),
                  ),
                  experienceView,
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

class LandingProjectsView extends StatelessWidget {
  const LandingProjectsView({
    Key? key,
    this.projects = const <LandingProjectViewData>[],
    required this.onGithubUrlTap,
  }) : super(key: key);

  final List<LandingProjectViewData> projects;
  final Function(String) onGithubUrlTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final data = projects[index];
        return LandingProjectViewItem(
          data: data,
          onGithubUrlTap: onGithubUrlTap,
        );
      },
    );
  }
}
