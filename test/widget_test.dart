import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gpt_vision_leaf_detect/main.dart';
import 'package:gpt_vision_leaf_detect/screens/homepage.dart';

void main() {
  testWidgets('tarot app loads and shows manual selection flow',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Aster Arcana'), findsOneWidget);
    await tester.pump();
    expect(find.textContaining('กำลังสุ่มไพ่'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 1200));
    await tester.pumpAndSettle();

    expect(find.textContaining('เลือกไพ่ 3 ใบ'), findsOneWidget);
  });

  test('tarot deck exposes a full 72-card working deck', () {
    expect(HomePage.totalDeckCount, 72);
  });
}
