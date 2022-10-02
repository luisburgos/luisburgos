import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'landing.dart';
import 'landing_project.dart';

class HighlightProjects extends StatelessWidget {
  const HighlightProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LandingProjectsView(
      projects: [
        LandingProjectViewData(
          name: 'Buzz',
          githubUrl: 'https://github.com/luisburgos/buzz',
        ),
        LandingProjectViewData(
          name: 'Neto',
          githubUrl: 'https://github.com/luisburgos/neto',
        ),
      ],
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
