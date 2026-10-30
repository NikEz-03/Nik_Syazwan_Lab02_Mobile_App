import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_flutter_app/main.dart';

void main() {
  testWidgets('Material Dropdown opens and selects value via DropdownButton', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const StudentInfoApp());
    await tester.pumpAndSettle();

    // Scroll to pickers
    await tester.drag(find.byType(ListView), const Offset(0, -400));
    await tester.pumpAndSettle();

    expect(find.text('Selected House: Slytherin'), findsOneWidget);

    // Tap dropdown in row
    final dropdownFinder = find.byType(DropdownButton<String>);
    expect(dropdownFinder, findsOneWidget);
    await tester.tap(dropdownFinder);
    await tester.pumpAndSettle();

    // In popup menu, find Gryffindor
    final gryffindorItem = find.text('Gryffindor').last;
    await tester.tap(gryffindorItem);
    await tester.pumpAndSettle();

    expect(find.text('Selected House: Gryffindor'), findsOneWidget);
  });

  testWidgets('Tapping blue Selected House text opens Material dropdown and selects value', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const StudentInfoApp());
    await tester.pumpAndSettle();

    // Scroll to pickers
    await tester.drag(find.byType(ListView), const Offset(0, -400));
    await tester.pumpAndSettle();

    // Tap Selected House text directly
    final selectedHouseFinder = find.text('Selected House: Slytherin');
    expect(selectedHouseFinder, findsOneWidget);
    await tester.tap(selectedHouseFinder);
    await tester.pumpAndSettle();

    // In popup menu, tap Ravenclaw
    final ravenclawItem = find.text('Ravenclaw').last;
    await tester.tap(ravenclawItem);
    await tester.pumpAndSettle();

    expect(find.text('Selected House: Ravenclaw'), findsOneWidget);
  });
}
