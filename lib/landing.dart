import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            LandingLabel(data.imageUrl),
            LandingLabel(data.name),
            LandingLabel(data.githubUrl),
          ],
        ),
      ),
    );
  }
}

class LandingLabel extends StatelessWidget {
  const LandingLabel(
    this.text, {
    Key? key,
    this.color = Colors.white,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont('Lato').copyWith(
        color: color,
      ),
    );
  }
}
