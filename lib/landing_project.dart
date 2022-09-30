import 'package:flutter/material.dart';

import 'landing_label.dart';

class LandingProjectViewData {
  LandingProjectViewData({
    required this.name,
    required this.githubUrl,
  });

  final String name;
  final String githubUrl;
}

class LandingProjectViewItem extends StatelessWidget {
  const LandingProjectViewItem({
    Key? key,
    required this.data,
    required this.onGithubUrlTap,
  }) : super(key: key);

  final Function(String) onGithubUrlTap;
  final LandingProjectViewData data;

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
