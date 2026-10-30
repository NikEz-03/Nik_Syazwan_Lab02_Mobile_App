import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:first_flutter_app/main.dart';

void main() {
  testWidgets('Lab 02 widgets render in portrait mode', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const StudentInfoApp());
    await tester.pumpAndSettle();

    expect(find.text('CSS3344 Mobile App Dev - Lab 02'), findsOneWidget);
    expect(find.text('NIK SYAZWAN IQBAL BIN SHADAN'), findsOneWidget);
    expect(find.text('Student ID: BCS24020038'), findsOneWidget);
    expect(find.text('Location Details'), findsOneWidget);
    expect(find.text('Interactive Pickers (Lab 2.2)'), findsOneWidget);
  });

  testWidgets('Cupertino Date Picker opens modal sheet with Done button', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const StudentInfoApp());
    await tester.pumpAndSettle();

    // Scroll down to see pickers
    await tester.drag(find.byType(ListView), const Offset(0, -400));
    await tester.pumpAndSettle();

    final datePickerBtn = find.text('Cupertino Date Picker (Modal Sheet)');
    await tester.tap(datePickerBtn);
    await tester.pumpAndSettle();

    expect(find.byType(CupertinoDatePicker), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);

    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();

    expect(find.byType(CupertinoDatePicker), findsNothing);
  });

  testWidgets('Cupertino House Wheel Picker opens modal sheet with Done button', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const StudentInfoApp());
    await tester.pumpAndSettle();

    // Scroll down to see pickers
    await tester.drag(find.byType(ListView), const Offset(0, -400));
    await tester.pumpAndSettle();

    final wheelPickerBtn = find.text('Cupertino House Wheel Picker');
    await tester.tap(wheelPickerBtn);
    await tester.pumpAndSettle();

    expect(find.byType(CupertinoPicker), findsOneWidget);
    expect(find.text('Done'), findsOneWidget);

    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();

    expect(find.byType(CupertinoPicker), findsNothing);
  });
}
