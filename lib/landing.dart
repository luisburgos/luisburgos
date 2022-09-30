import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'landing_label.dart';
import 'landing_project.dart';

class LandingViewData {
  LandingViewData({
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.githubUrl,
    this.projects = const <LandingProjectViewData>[],
  });

  final String imageUrl;
  final String name;
  final String role;
  final String githubUrl;
  final List<LandingProjectViewData> projects;
}

class LandingView extends StatelessWidget {
  const LandingView({
    Key? key,
    required this.data,
    this.footer,
  }) : super(key: key);

  final LandingViewData data;
  final Widget? footer;

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
                  LandingLabel(data.role),
                  LandingLabel(data.githubUrl),
                  LandingProjectsView(
                    projects: data.projects,
                    onGithubUrlTap: (url) async {
                      //TODO: Refactor to move logic out af the view.
                      final uri = Uri.parse(url);
                      if (!await launchUrl(uri)) {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
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
