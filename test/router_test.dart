import 'package:flutter_test/flutter_test.dart';
import 'package:deeplink/router.dart';

void main() {
  group('AppRouter', () {
    test('appRouter is not null', () {
      expect(appRouter, isNotNull);
    });

    test('appRouter has correct initial location', () {
      expect(appRouter.routeInformationProvider.value.uri.path, equals('/'));
    });
  });
}
