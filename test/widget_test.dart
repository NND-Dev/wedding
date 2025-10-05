import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wedding_invitation_app/main.dart';
import 'package:wedding_invitation_app/core/di/service_locator.dart';

void main() {
  group('Wedding App Tests', () {
    setUpAll(() async {
      // Setup dependencies for testing
      await sl.setupDependencies();
    });

    tearDownAll(() {
      // Clean up
      sl.clear();
    });

    testWidgets('Wedding app smoke test', (WidgetTester tester) async {
      // Setup DI before testing
      await sl.setupDependencies();

      // Build our app and trigger a frame.
      await tester.pumpWidget(const WeddingApp());

      // Wait for the app to load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify that our app starts successfully - look for wedding invitation text
      expect(find.textContaining('Wedding Invitation'), findsOneWidget);
    });

    testWidgets('App theme test', (WidgetTester tester) async {
      await sl.setupDependencies();

      await tester.pumpWidget(const WeddingApp());
      await tester.pumpAndSettle();

      // Check if MaterialApp is properly configured
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.title, equals('Wedding Invitation'));
      expect(materialApp.debugShowCheckedModeBanner, isFalse);
    });
  });
}
