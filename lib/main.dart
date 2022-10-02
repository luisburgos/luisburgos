import 'package:flutter/material.dart';

import 'copyright_footer.dart';
import 'landing.dart';
import 'landing_project.dart';

void main() {
  runApp(const WebsiteApp());
}

class WebsiteApp extends StatelessWidget {
  const WebsiteApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LandingView(
          data: LandingViewData(
            imageUrl: 'FOTO',
            name: 'Luis Burgos',
            description:
                'Staff Mobile Engineer @kueski currently living in 🇲🇽 CDMX, México.',
            githubUrl: 'https://github.com/luisburgos',
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
          ),
          footer: const CopyrightFooterView(),
        ),
      ),
    );
  }
}
