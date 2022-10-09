import 'package:flutter/material.dart';
import 'package:luisburgos/yaml/reader.dart';

import 'copyright_footer.dart';
import 'experience.dart';
import 'highlight_projects.dart';
import 'landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final siteModel = await YamlReader(
    fileName: 'site.yaml',
    parser: SiteYamlParser(),
  ).read();

  runApp(WebsiteApp(siteModel));
}

class WebsiteApp extends StatelessWidget {
  const WebsiteApp(
    this.siteModel, {
    Key? key,
  }) : super(key: key);

  final SiteModel siteModel;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LandingView(
          data: LandingViewData(
            imageUrl: siteModel.imageUrl,
            name: siteModel.name,
            description: siteModel.description,
            githubUrl: siteModel.githubUrl,
          ),
          highlightProjectsView: HighlightProjectsView(siteModel.projects),
          experienceView: ExperienceView(siteModel.experiences),
          footer: const CopyrightFooterView(),
        ),
      ),
    );
  }
}
