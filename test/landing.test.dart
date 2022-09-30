import 'package:flutter_test/flutter_test.dart';
import 'package:luisburgos/landing.dart';

void main() {
  testWidgets('LandingViewData full', (tester) async {
    await tester.pumpWidget(
      LandingView(
        data: LandingViewData(
          imageUrl: 'FOTO',
          name: 'Luis Burgos',
          role: 'Staff Mobile Engineer @kueski',
          githubUrl: 'https://github.com/luisburgos',
        ),
      ),
    );
    final imageUrlFinder = find.text('FOTO');
    final nameFinder = find.text('Luis Burgos');
    final roleFinder = find.text('Staff Mobile Engineer @kueski');
    final githubUrlFinder = find.text('https://github.com/luisburgos');

    expect(imageUrlFinder, findsOneWidget);
    expect(nameFinder, findsOneWidget);
    expect(roleFinder, findsOneWidget);
    expect(githubUrlFinder, findsOneWidget);
  });
}
