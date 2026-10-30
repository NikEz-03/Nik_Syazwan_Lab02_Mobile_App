import 'package:flutter_test/flutter_test.dart';
import 'package:first_flutter_app/main.dart';

void main() {
  testWidgets('Student info app loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const StudentInfoApp());
    expect(find.text('CSS3344 Mobile App Dev - Lab 02'), findsOneWidget);
  });
}
