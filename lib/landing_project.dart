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
  }) : super(key: key);

  final LandingProjectViewData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: LandingLabel(data.name),
      trailing: ElevatedButton(
        child: Text(data.githubUrl),
        onPressed: () {
          //TODO: Implement
        },
      ),
    );
  }
}
