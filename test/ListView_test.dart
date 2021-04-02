import 'package:blocfilterlist/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:blocfilterlist/main.dart';

void main() {
  testWidgets('Testing List View', (WidgetTester tester) async {
    await tester.pumpWidget(HomeScreen());
    expect(find.byKey(ValueKey('TestingListView')), findsOneWidget);
  });
}
