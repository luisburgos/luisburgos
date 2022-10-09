import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luisburgos/landing.dart';
import 'package:luisburgos/landing_label.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'reader.dart';

class BlogView extends StatelessWidget {
  const BlogView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MarkdownReader(
        fileName: 'assets/blog/hello_world.md',
      ).read(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              const LandingLabel('Blog'),
              const LandingDivider(),
              SizedBox(
                height: 300,
                child: MarkdownWidget(
                  data: snapshot.data!.toString(),
                  styleConfig: StyleConfig(
                    titleConfig: TitleConfig(
                      showDivider: false,
                      h1: GoogleFonts.rubik().copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                      h2: GoogleFonts.rubik().copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
