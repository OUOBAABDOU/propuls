import 'package:flutter_test/flutter_test.dart';

import 'package:prop/main.dart';

void main() {
  testWidgets('PROPELIUM home renders core navigation', (tester) async {
    await tester.pumpWidget(const PropeliumApp());

    expect(find.text('PROPELIUM'), findsOneWidget);
    expect(find.text('Catalogue'), findsWidgets);
    expect(find.text('Apprenant'), findsWidgets);
    expect(find.text('Formateur'), findsWidgets);
    expect(find.text('Admin'), findsWidgets);
  });
}
