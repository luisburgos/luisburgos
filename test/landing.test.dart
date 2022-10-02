import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:luisburgos/landing.dart';

void main() {
  testWidgets('LandingViewData full', (tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: const MediaQueryData(),
          child: LandingView(
            data: LandingViewData(
              imageUrl: 'FOTO',
              name: 'Luis Burgos',
              description:
                  'Staff Mobile Engineer @kueski currently living in 🇲🇽 CDMX, México.',
              githubUrl: 'https://github.com/luisburgos',
            ),
            experienceView: Container(),
            highlightProjectsView: Container(),
          ),
        ),
      ),
    );
    final imageUrlFinder = find.text('FOTO');
    final nameFinder = find.text('Luis Burgos');
    final roleFinder = find.text(
        'Staff Mobile Engineer @kueski currently living in 🇲🇽 CDMX, México.');
    final githubUrlFinder = find.text('https://github.com/luisburgos');

    expect(imageUrlFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(roleFinder, findsOneWidget);
    expect(githubUrlFinder, findsOneWidget);
  });
}
