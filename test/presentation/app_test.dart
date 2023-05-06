import 'package:flutter_test/flutter_test.dart';
import 'package:solid_software_test_app/presentation/app.dart';
import 'package:solid_software_test_app/utils/constants.dart';

void main() {
  testWidgets(
    'App Widget',
    (WidgetTester tester) async {
      // Render the widget
      await tester.pumpWidget(
        const App(),
      );
      expect(find.byKey(appKey), findsOneWidget);
    },
  );
}
