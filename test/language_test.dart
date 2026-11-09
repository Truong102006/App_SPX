import 'package:app_spx/main.dart';
import 'package:app_spx/core/localization/app_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('all eight screens render in Vietnamese', (tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const SpxExpressApp());
    await tester.tap(find.byKey(const ValueKey('language-settings')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('language-vietnamese')));
    await tester.pumpAndSettle();
    for (final title in [
      'Tiện ích của tôi',
      'Đơn hàng có thể giao chậm',
      'Vì sao đơn hàng giao chậm?',
      'Thời gian giao hàng và\ncập nhật trạng thái',
      'Bạn cần hỗ trợ gì?',
      'Gửi yêu cầu hỗ trợ?',
      'Theo dõi yêu cầu hỗ trợ',
      'Kết quả xử lý',
    ]) {
      expect(find.text(title), findsOneWidget);
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets(
      'settings switches both ways and retains Vietnamese on navigation',
      (tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const SpxExpressApp());
    await tester.tap(find.text('0. Account & Utilities').first);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('language-settings')));
    await tester.pumpAndSettle();
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('Tiếng Việt'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('language-vietnamese')));
    await tester.pumpAndSettle();
    expect(find.text('Tiện ích của tôi'), findsOneWidget);
    expect(find.text('My Utilities'), findsNothing);
    await tester.tap(find.text('Đơn hàng').last);
    await tester.pumpAndSettle();
    expect(find.text('Đơn hàng có thể giao chậm'), findsOneWidget);
    await tester.tap(find.text('Tài khoản'));
    await tester.pumpAndSettle();
    expect(find.text('Tiện ích của tôi'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('language-settings')));
    await tester.pumpAndSettle();
    expect(find.text('Ngôn ngữ'), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('language-english')));
    await tester.pumpAndSettle();
    expect(find.text('My Utilities'), findsOneWidget);
    expect(find.text('Tiện ích của tôi'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  test('translations preserve parcel identity and dates', () {
    expect(translateVietnamese('SPXVN-DEMO-261102-0042'),
        'SPXVN-DEMO-261102-0042');
    expect(translateVietnamese('Sony WH-1000XM5 Wireless Headphones'),
        'Sony WH-1000XM5 Wireless Headphones');
    expect(translateVietnamese('Sorting Hub – Ho Chi Minh City'),
        'Sorting Hub – Ho Chi Minh City');
    expect(translateVietnamese('Updated: 08:00, 03/11/2026 ICT'),
        'Cập nhật: 08:00, 03/11/2026 ICT');
  });
}
