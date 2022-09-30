import 'package:flutter/material.dart';

class LandingViewData {
  LandingViewData({
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.githubUrl,
  });

  final String imageUrl;
  final String name;
  final String role;
  final String githubUrl;
}

class LandingView extends StatelessWidget {
  const LandingView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final LandingViewData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black87,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: Column(
          children: [
            Text(data.imageUrl),
            Text(data.name),
            Text(data.githubUrl),
          ],
        ),
      ),
    );
  }
}
