import 'package:flutter_test/flutter_test.dart';

import 'package:boozin_fitness/main.dart';

void main() {
  testWidgets('App pumps without error', (WidgetTester tester) async {
    await tester.pumpWidget(const BoozinFitnessApp());
    expect(find.byType(BoozinFitnessApp), findsOneWidget);
  });
}
