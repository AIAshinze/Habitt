import 'package:flutter_test/flutter_test.dart';

import 'package:habit_tracker/main.dart';

void main() {
  testWidgets('app starts on the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Habitt'), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
    expect(find.text('Flutter Demo Home Page'), findsNothing);
  });
}
