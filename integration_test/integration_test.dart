import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:win_interview/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter App Integration Test', () {
    testWidgets('Counter increments test', (WidgetTester tester) async {
      // Start the app.
      app.main();
      await tester.pumpAndSettle();

      // Verify initial counter value is 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the "+" button.
      final Finder fab = find.byTooltip('Increment');
      await tester.tap(fab);

      // Rebuild the widget after the state has changed.
      await tester.pumpAndSettle();

      // Verify the counter increments to 1.
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });
  });
}
