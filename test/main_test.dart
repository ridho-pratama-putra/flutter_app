// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';

void main() {
  testWidgets(
      'can show alert dialog about more facts and Ok! button smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('wrongButton')));
    await tester.pump();
    expect(
        find.byKey(const Key('moreAboutThisFactAlertDialog')), findsOneWidget);
    expect(find.text('Ok!'), findsOneWidget);
  });

  testWidgets('increment current score when choose correct answer smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('your score'), findsOneWidget);
    await tester.tap(find.byKey(const Key('wrongButton')));
    await tester.pump();
    expect(
        tester
            .firstWidget<Text>(find.byKey(const Key('scoreText')))
            .data
            .toString(),
        '0');

    await tester.tap(find.byKey(const Key('moreAboutThisFactOkButton')));
    await tester.pump();
    expect(
        tester
            .firstWidget<Text>(find.byKey(const Key('scoreText')))
            .data
            .toString(),
        '5');
  });

  testWidgets('con dismiss modal when click Ok! smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('wrongButton')));
    await tester.pump();

    await tester.tap(find.byKey(const Key('moreAboutThisFactOkButton')));
    await tester.pump();
    expect(find.byKey(const Key('moreAboutThisFactAlertDialog')), findsNothing);
  });

  testWidgets('decrement current score when wrong answer smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('correctButton')));
    await tester.pump();
    expect(
        tester
            .firstWidget<Text>(find.byKey(const Key('scoreText')))
            .data
            .toString(),
        '0');

    await tester.tap(find.byKey(const Key('moreAboutThisFactOkButton')));
    await tester.pump();
    expect(
        tester
            .firstWidget<Text>(find.byKey(const Key('scoreText')))
            .data
            .toString(),
        '-1');
  });
}
