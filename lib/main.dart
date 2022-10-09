import 'package:flutter/material.dart';

import 'blog/view.dart';
import 'copyright_footer.dart';
import 'experience.dart';
import 'highlight_projects.dart';
import 'landing.dart';
import 'yaml/reader.dart';
import 'yaml/yaml_to_site.dart';

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
          blog: const BlogView(),
        ),
      ),
    );
  }
}
