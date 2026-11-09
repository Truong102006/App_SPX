import 'package:app_spx/core/localization/app_language.dart';
import 'package:app_spx/main.dart';
import 'package:app_spx/features/account/presentation/screens/demo_vouchers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('standard support also offers a voucher after confirmation', (tester) async {
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const SpxExpressApp());
    final support = find.text('4. Delayed Support (04/06)').first;
    await tester.ensureVisible(support);
    await tester.tap(support);
    await tester.pumpAndSettle();
    final submit = find.text('Submit Support Request');
    await tester.ensureVisible(submit);
    await tester.tap(submit);
    await tester.pumpAndSettle();
    expect(find.text('Delivery service: SPX Instant (Express)'), findsNothing);
    await tester.tap(find.text('Confirm and submit'));
    await tester.pumpAndSettle();
    expect(find.text('Track Support Request'), findsOneWidget);
    expect(find.text('A gift from SPX'), findsOneWidget);
    expect(find.text('Choose Shopee voucher'), findsOneWidget);
    expect(find.text('Choose SPX voucher'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  for (final vietnamese in [false, true]) {
    for (final shopee in [true, false]) {
      testWidgets(
          'urgent support claims ${shopee ? 'Shopee' : 'SPX'} voucher into wallet (vi=$vietnamese)',
          (tester) async {
        Finder label(String text) =>
            find.text(vietnamese ? translateVietnamese(text) : text);
        tester.view.physicalSize = const Size(1920, 1080);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);
        await tester.pumpWidget(const SpxExpressApp());
        if (vietnamese) {
          AppLanguageScope.maybeOf(tester.element(find.text('My Utilities')))!
              .onChanged(AppLanguage.vietnamese);
          await tester.pumpAndSettle();
        }
        await tester.ensureVisible(label('4. Delayed Support (04/06)').first);
        await tester.tap(label('4. Delayed Support (04/06)').first);
        await tester.pumpAndSettle();
        final urgent = label('Request urgent delivery support');
        await tester.ensureVisible(urgent);
        await tester.tap(urgent);
        await tester.pumpAndSettle();
        expect(
            label('Delivery service: SPX Instant (Express)'), findsOneWidget);
        expect(label('Submit Support Request?'), findsOneWidget);
        await tester.tap(label('Confirm and submit'));
        await tester.pumpAndSettle();
        expect(label('Track Support Request'), findsOneWidget);
        expect(label('A gift from SPX'), findsOneWidget);
        final choice =
            label(shopee ? 'Choose Shopee voucher' : 'Choose SPX voucher');
        await tester.ensureVisible(choice);
        await tester.tap(choice);
        await tester.pumpAndSettle();
        expect(label('Voucher received!'), findsOneWidget);
        final code = 'DEMO-${shopee ? 'SHOPEE' : 'SPX'}-3';
        expect(label(code), findsOneWidget);
        await tester.tap(find.descendant(
            of: find.byType(DemoVoucherPanel), matching: label('Done')));
        await tester.pumpAndSettle();
        await tester.tap(label('Account'));
        await tester.pumpAndSettle();
        final wallet = label('My Promo\nCodes');
        await tester.ensureVisible(wallet);
        await tester.tap(wallet);
        await tester.pumpAndSettle();
        expect(label('My Promo Codes'), findsOneWidget);
        expect(label(code), findsOneWidget);
        expect(label('DEMO-SHOPEE-10'), findsOneWidget);
        expect(label('DEMO-SPX-30K'), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }
  }

  test('voucher expires fifteen days after receipt', () {
    final receipt = DateTime(2026, 11, 8, 14, 30);
    final voucher =
        DemoVoucher(code: 'DEMO', shopee: true, receivedAt: receipt);
    expect(voucher.expiresAt.difference(receipt), const Duration(days: 15));
  });
}
